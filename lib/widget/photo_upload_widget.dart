import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../controller/register_klaim_controller.dart';

class PhotoUploadWidget extends StatelessWidget {
  final String label;
  final String labelInfo;
  final Rx<XFile?> imageFile;
  final RegisterClaimController controller = Get.find();

  PhotoUploadWidget({
    Key? key,
    required this.label,
    required this.imageFile,
    required this.labelInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      validator: (value) {
        if (imageFile.value == null) {
          return 'Please upload $label';
        }
        return null;
      },
      builder: (FormFieldState<bool> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 10),
              child: Text(
                label,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Obx(() {
              return imageFile.value != null
                  ? Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: FileImage(File(imageFile.value!.path)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red.shade50.withOpacity(0.8),
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                      ),
                      child: IconButton(
                        onPressed: () => controller.removeImage(imageFile),
                        icon: Icon(Icons.delete, color: Colors.red.shade100),
                        padding: EdgeInsets.zero,
                        iconSize: 24.0,
                      ),
                    ),
                  ),
                ],
              )
                  : Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton(
                  onPressed: () => controller.showImageSourceDialog(context, imageFile),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.add_circle_rounded, size: 40, color: Colors.blue),
                      const SizedBox(height: 10),
                      Text(
                        "Upload $label",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 10),
            Text(
              labelInfo,
              style: const TextStyle(fontSize: 12, color: Colors.blue),
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  state.errorText!,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }
}
