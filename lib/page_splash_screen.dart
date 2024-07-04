import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:seru_test_dadah_taufik/routes/app_routes.dart';

class PageSplashScreen extends StatelessWidget {
  const PageSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: const Image(
          image: AssetImage('assets/images/splash.png'), fit: BoxFit.cover),
      logoWidth: 150,
      title: const Text(
        "Dadah Taufik Permana",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      loaderColor: Colors.blue.shade500,
      showLoader: true,
      loadingText: const Text("Loading"),
      durationInSeconds: 3,
      navigator: Routes.REGISTER_CLAIM,
    );
  }
}
