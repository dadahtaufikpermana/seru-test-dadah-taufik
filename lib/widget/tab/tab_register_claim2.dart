import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/register_klaim_controller.dart';
import '../button_primary.dart';
import '../photo_upload_widget.dart';
import 'card_information.dart';

class TabRegisterClaim2 extends GetView<RegisterClaimController> {

  final GlobalKey<FormState> formKey;

  const TabRegisterClaim2({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            CardInformation(children: controller.listRowInformationFormSimStnk),
            const SizedBox(height: 20),
            PhotoUploadWidget(
              label: "Foto Selfie",
              imageFile: controller.selfiePhoto,
              labelInfo: "*Data Pada Poto Selfie Harus Terlihat Jelas",
            ),
            PhotoUploadWidget(
              label: "Foto KTP",
              imageFile: controller.ktpPhoto,
              labelInfo: "*Data Pada Poto Selfie Harus Terlihat Jelas",
            ),
            PhotoUploadWidget(
              label: "Foto Bebas",
              imageFile: controller.bebasPhoto,
              labelInfo: "*Data Pada Poto Selfie Harus Terlihat Jelas",
            ),
            const SizedBox(height: 20),
            Container(width: double.infinity, child: _buildNextButton()),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton() {
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
