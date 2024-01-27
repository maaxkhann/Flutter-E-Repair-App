import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConstantTextField extends StatelessWidget {
  final String hintText;
  const ConstantTextField({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Get.width * 0.08),
              borderSide: const BorderSide(color: Color(0xFFA7A7A7))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Get.width * 0.08),
              borderSide: const BorderSide(color: Color(0xFFA7A7A7)))),
    );
  }
}
