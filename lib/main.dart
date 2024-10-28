import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sumbertugu/routes/routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPage.getNavbar(),
      getPages: AppPage.routes,
    ),
  );
}
