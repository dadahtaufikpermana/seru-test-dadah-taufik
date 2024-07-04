import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Model CardItem
class CardItem {
  final String text;
  final Color color;
  final IconData icon;
  final Color colorBackground;

  CardItem({
    required this.text,
    required this.color,
    required this.icon,
    required this.colorBackground
  });
}
class Controller extends GetxController with SingleGetTickerProviderMixin {
  RxInt selectedPage = 0.obs;
  late TabController tabController;


  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  var cardList = <CardItem>[
    CardItem(
      text: 'Formulir Klaim',
      color: Colors.red,
      icon: Icons.menu_book_rounded,
      colorBackground: Colors.red.shade100,
    ),
    CardItem(
      text: 'Foto SIM & STNK',
      color: Colors.green,
      icon: Icons.card_membership_rounded,
      colorBackground: Colors.green.shade50,
    ),
    CardItem(
      text: 'Klaim Kerusakan\nKendaraan',
      color: Colors.blue,
      icon: Icons.car_crash_outlined,
      colorBackground: Colors.blue.shade50,
    ),
  ].obs;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: cardList.length);
    super.onInit();
  }

  void setSelectedPage(int index) {
    selectedPage(index);
    tabController.animateTo(index);
  }

  bool validateCurrentForm() {
    switch (selectedPage.value) {
      case 0:
        return formKey1.currentState?.validate() ?? false;
      case 1:
        return formKey2.currentState?.validate() ?? false;
      default:
        return false;
    }
  }

  void setSelectedPageWithoutValidation(int index) {
    selectedPage(index);
    tabController.animateTo(index);
  }

  void navigateToPage(int index) {
    if (index > selectedPage.value) {
      if (validateCurrentForm()) {
        setSelectedPage(index);
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
    } else {
      setSelectedPageWithoutValidation(index);
    }
  }
}