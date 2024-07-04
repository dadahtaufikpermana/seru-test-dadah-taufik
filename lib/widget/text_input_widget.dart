import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final int maxLines;
  final double height;
  final FormFieldValidator<String>? validator;

  TextInputWidget({
    required this.label,
    required this.controller,
    this.maxLines = 1,
    this.height = 50,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
      validator: validator,
    );
  }
}

