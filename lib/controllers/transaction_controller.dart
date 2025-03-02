import 'dart:typed_data';

import 'package:esjerukkadiri/commons/currency.dart';
import 'package:esjerukkadiri/models/cart_model.dart';
import 'package:esjerukkadiri/models/transaction_detail_model.dart';
import 'package:esjerukkadiri/models/transaction_model.dart';
import 'package:esjerukkadiri/networks/api_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image/image.dart';
import 'package:intl/intl.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:flutter_esc_pos_utils/flutter_esc_pos_utils.dart';

class TransactionController extends GetxController {
  var transactionItems = <TransactionModel>[].obs;
  List<CartModel> cartList = <CartModel>[].obs;
  var isLoading = true.obs;
  var isLoadingDetail = true.obs;
  var expandedIndex = (-1).obs;
  var transactionDetailItems = <TransactionDetailModel>[].obs;
  var total = 0.obs;
  var startDate = DateTime.now().obs;
  var endDate = DateTime.now().obs;
  var textStartDate = ''.obs;
  var textEndDate = ''.obs;

  @override
  void onInit() {
    fetchTransaction();
    super.onInit();
  }

  void fetchTransaction() async {
    try {
      isLoading(true);
      var result = await RemoteDataSource.getTransactions(
          startDate.value, endDate.value);
      if (result != null) {
        transactionItems.assignAll(result);
        total.value = transactionItems
            .map((e) => e.grandTotal ?? 0)
            .fold(0, (value, element) => value + element);
      }
    } finally {
      isLoading(false);
    }
  }

  void getTransactionDetails(int numerator, String kios) async {
    try {
      isLoadingDetail(true);
      var result =
          await RemoteDataSource.getTransactionDetails(numerator, kios);
      if (result != null) {
        transactionDetailItems.assignAll(result);
      }
    } finally {
      isLoadingDetail(false);
    }
  }

  void PrintTransaction(int numerator, String kios) async {
    bool connectionStatus = await PrintBluetoothThermal.connectionStatus;
    if (connectionStatus) {
      List<int> nota = await printPurchaseOrder(numerator, kios);
      var resultPrint = await PrintBluetoothThermal.writeBytes(nota);
      if (!resultPrint) {
        Get.snackbar('Notification', 'Failed to print',
            icon: const Icon(Icons.error), snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      Get.snackbar('Notification', 'Bluetooth not connected',
          icon: const Icon(Icons.error), snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<List<int>> printPurchaseOrder(int numerator, String kios) async {
    List<int> bytes = [];
    // Using default profile
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);
    bytes += generator.reset();

    // IMAGE
    final ByteData data = await rootBundle.load('assets/images/logo.jpg');
    final Uint8List bytesImg = data.buffer.asUint8List();
    final image = decodeImage(bytesImg);
    final resizedImage = copyResize(image!, width: 250);
    bytes += generator.image(resizedImage);

    var result = await RemoteDataSource.getTransactionDetails(numerator, kios);
    transactionDetailItems.assignAll(result!);
    // CART LIST
    for (var cartItem in transactionDetailItems) {
      bytes += generator.row([
        PosColumn(
          text: cartItem.productName ?? 'Unknown Product',
          width: 7,
          styles: const PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text: cartItem.quantity.toString(),
          width: 2,
          styles: const PosStyles(align: PosAlign.center),
        ),
        PosColumn(
          text: (cartItem.totalPrice).toString(),
          width: 3,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);
    }
    bytes += generator.hr();
    bytes += generator.row([
      PosColumn(
        text: 'Total',
        width: 6,
        styles: const PosStyles(align: PosAlign.left, bold: true),
      ),
      PosColumn(
        text: CurrencyFormat.convertToIdr(
            transactionDetailItems
                .map((e) => e.totalPrice)
                .fold(0, (value, element) => value + element!),
            0),
        width: 6,
        styles: const PosStyles(align: PosAlign.right, bold: true),
      ),
    ]);

    //barcode
    // final List<int> barData = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 4];
    // bytes += generator.barcode(Barcode.upcA(barData));

    //QR code
    bytes += generator.qrcode('https://www.instagram.com/esjeruk.kadiri/');
    bytes += generator.text(
        DateFormat('dd-MM-yyyy HH:mm').format(DateTime.now()),
        styles: const PosStyles(align: PosAlign.center));

    bytes += generator.feed(1);

    // IMAGE
    final ByteData _dataHastag =
        await rootBundle.load('assets/images/hastag.jpg');
    final Uint8List _bytesImgHastag = _dataHastag.buffer.asUint8List();
    final _imageHastag = decodeImage(_bytesImgHastag);
    final _resizedImageHastag = copyResize(_imageHastag!, width: 300);
    bytes += generator.image(_resizedImageHastag);

    bytes += generator.feed(2);
    // bytes += generator.cut();
    return bytes;
  }

  bool disableDate(DateTime day) {
    if ((day.isBefore(DateTime.now().add(const Duration(days: 0))))) {
      return true;
    }
    return false;
  }

  chooseDate(startorend) async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: startorend == 'start' ? startDate.value : endDate.value,
        firstDate: DateTime(DateTime.now().year - 1),
        lastDate: DateTime(DateTime.now().year + 1),
        //initialEntryMode: DatePickerEntryMode.input,
        // initialDatePickerMode: DatePickerMode.year,
        // helpText: 'Pilih Tanggal Uji',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter valid date range',
        // fieldLabelText: 'Pilih Tanggal Uji',
        fieldHintText: 'Month/Date/Year',
        selectableDayPredicate: disableDate);
    if (startorend == 'start') {
      if (pickedDate != null && pickedDate != startDate.value) {
        startDate.value = pickedDate;
        textStartDate.value =
            DateFormat('dd MMMM yyyy').format(startDate.value);
      }
    } else {
      if (pickedDate != null && pickedDate != endDate.value) {
        endDate.value = pickedDate;
        textEndDate.value = DateFormat('dd MMMM yyyy').format(endDate.value);
      }
    }
  }
}
