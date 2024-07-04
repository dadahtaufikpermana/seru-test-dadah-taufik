import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';

class WidgetCardClaim extends GetView<Controller> {
  const WidgetCardClaim({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 8),
          child: Obx(() {
            final selectedText = controller.cardList[controller.selectedPage.value].text;
            return Text(
              selectedText,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Colors.blue),
            );
          }),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Obx(() {
            return ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: controller.cardList.length,
              itemBuilder: (context, index) {
                final cardData = controller.cardList[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () => controller.navigateToPage(index),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 12,
                                decoration: BoxDecoration(
                                  color: cardData.color,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                  ),
                                ),
                              ),
                              Container(
                                height: 80,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: cardData.colorBackground,
                                ),
                                child: Icon(
                                  cardData.icon,
                                  size: 45,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              cardData.text,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
