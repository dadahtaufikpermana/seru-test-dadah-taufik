import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seru_test_dadah_taufik/widget/tab/tab_register_claim1.dart';
import 'package:seru_test_dadah_taufik/widget/tab/tab_register_claim2.dart';
import 'package:seru_test_dadah_taufik/widget/tab/tab_register_claim3.dart';

import '../controller/controller.dart';

class CustomTabbar extends GetView<Controller> {
  const CustomTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.tabController,
                children: [
                  TabRegisterClaim1(formKey: controller.formKey1),
                  TabRegisterClaim2(formKey: controller.formKey2),
                  TabRegisterClaim3(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
