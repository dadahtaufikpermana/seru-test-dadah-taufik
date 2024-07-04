import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardInformation extends StatelessWidget {
  const CardInformation({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
          border: Border(
              left: BorderSide(width: 0.2),
              top: BorderSide(width: 0.2),
              right: BorderSide(width: 0.2),
              bottom: BorderSide(
                width: 0.2,
              )),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
