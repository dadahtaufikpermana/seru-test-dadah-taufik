import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seru_test_dadah_taufik/routes/app_pages.dart';
import 'package:seru_test_dadah_taufik/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      getPages: AppPages.pages,
      initialRoute: Routes.INITIAL,
    );
  }
}
