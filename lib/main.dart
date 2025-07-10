import 'package:flutter/material.dart';
import 'package:flutter_ecom/app/bindings/auth_binding.dart';

import 'package:get/get.dart';
// import 'package:salait_ecommerce/app/bindings/auth_binding.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: "/authWrapper",
      initialBinding: AuthBinding(),
      getPages: AppPages.routes,
    ),
  );
}