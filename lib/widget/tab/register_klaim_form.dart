import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/register_klaim_controller.dart';
import '../dropdown_search_widget.dart';
import '../text_input_widget.dart';

class RegisterKlaimForm extends GetView<RegisterClaimController> {
  const RegisterKlaimForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          border: Border(
              left: BorderSide(width: 0.2),
              top: BorderSide(width: 0.2),
              right: BorderSide(width: 0.2),
              bottom: BorderSide(
                width: 0.2,
              )),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        children: [
          Text(
            "Nama Pengemudi",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 20,
          ),
          TextInputWidget(
            label: "First Name",
            controller: controller.firstNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'First Name cannot be empty';
              }
              return null;
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextInputWidget(
            label: "Last Name",
            controller: controller.lastNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Last Name cannot be empty';
              }
              return null;
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextInputWidget(
            label: "Biodata",
            controller: controller.biodataController,
            maxLines: 5,
            height: 100,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Biodata cannot be empty';
              }
              return null;
            },
          ),
          SizedBox(
            height: 20,
          ),
          Obx(() {
            return DropdownSearchWidget(
              label: "Provinsi",
              items: provinsiKota.keys.toList(),
              selectedItem: controller.selectedProvinsi.value,
              onChanged: (value) {
                controller.selectedProvinsi.value = value ?? '';
                controller.updateKota(value!);
                controller.selectedKota.value = '';
                controller.selectedKecamatan.value = '';
                controller.selectedKelurahan.value = '';
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Provinsi cannot be empty';
                }
                return null;
              },
            );
          }),
          SizedBox(
            height: 20,
          ),
          Obx(() {
            return DropdownSearchWidget(
              label: "Kota",
              items: controller.kotaList,
              selectedItem: controller.selectedKota.value,
              onChanged: (value) {
                controller.selectedKota.value = value ?? '';
                controller.updateKecamatan(value!);
                controller.selectedKecamatan.value = '';
                controller.selectedKelurahan.value = '';
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Kota cannot be empty';
                }
                return null;
              },
            );
          }),
          SizedBox(
            height: 20,
          ),
          Obx(() {
            return DropdownSearchWidget(
              label: "Kecamatan",
              items: controller.kecamatanList,
              selectedItem: controller.selectedKecamatan.value,
              onChanged: (value) {
                controller.selectedKecamatan.value = value ?? '';
                controller.updateKelurahan(value!);
                controller.selectedKelurahan.value = '';
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Kecamatan cannot be empty';
                }
                return null;
              },
            );
          }),
          SizedBox(
            height: 20,
          ),
          Obx(() {
            return DropdownSearchWidget(
              label: "Kelurahan",
              items: controller.kelurahanList,
              selectedItem: controller.selectedKelurahan.value,
              onChanged: (value) => controller.selectedKelurahan.value = value!,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Kelurahan cannot be empty';
                }
                return null;
              },
            );
          }),
        ],
      ),
    );
  }
}
