import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seru_test_dadah_taufik/widget/tab/register_klaim_form.dart';
import '../../controller/register_klaim_controller.dart';
import '../button_primary.dart';
import 'card_information.dart';

class TabRegisterClaim1 extends GetView<RegisterClaimController> {
  final GlobalKey<FormState> formKey;

  TabRegisterClaim1({required this.formKey});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Container(
                  padding: EdgeInsets.only(left: 12, right: 15, top: 10, bottom: 10),
                  decoration: ShapeDecoration(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Registrasi Klaim B 12345 EFG",
                          softWrap: true,
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CardInformation(children: controller.listRowInformationFormClaim),
              const SizedBox(height: 30),
              const RegisterKlaimForm(),
              const SizedBox(height: 160),
              Container(
                width: double.infinity,
                child: _buildNextButton(),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    final controller = Get.find<RegisterClaimController>();
    return ButtonPrimary(
      title: 'Next',
      onPressed: () {
        if (formKey.currentState?.validate() ?? false) {
          int nextIndex = controller.mainController.tabController.index + 1;
          if (nextIndex < controller.mainController.tabController.length) {
            controller.mainController.setSelectedPage(nextIndex);
          }
        } else {
          Get.snackbar(
            'Validation Error',
            'Please fill out all fields.',
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      },
    );
  }
}
