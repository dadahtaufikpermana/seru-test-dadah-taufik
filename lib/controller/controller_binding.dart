import 'package:get/get.dart';
import 'package:seru_test_dadah_taufik/controller/register_klaim_controller.dart';

import 'controller.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controller>(() => Controller());
    Get.lazyPut<RegisterClaimController>(() => RegisterClaimController());
  }
}