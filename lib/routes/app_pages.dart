import 'package:get/get.dart';

import '../controller/controller_binding.dart';
import '../page_splash_screen.dart';
import '../register_claim_1/page_register_claim_1.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const PageSplashScreen(),
    ),
    GetPage(
        name: Routes.REGISTER_CLAIM,
        page: () => const PageRegisterClaim(),
        binding: BindingController())
  ];
}
