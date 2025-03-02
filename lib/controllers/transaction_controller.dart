import 'package:esjerukkadiri/models/transaction_detail_model.dart';
import 'package:esjerukkadiri/models/transaction_model.dart';
import 'package:esjerukkadiri/networks/api_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransactionController extends GetxController {
  var transactionItems = <TransactionModel>[].obs;
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
