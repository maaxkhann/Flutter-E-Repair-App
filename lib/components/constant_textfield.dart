import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConstantTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool? isExpand;
  const ConstantTextField(
      {super.key, required this.hintText, this.isExpand, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      expands: isExpand ?? false,
      maxLines: isExpand == true ? null : 1,
      decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Get.width * 0.06),
              borderSide: const BorderSide(color: Color(0xFFA7A7A7))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Get.width * 0.06),
              borderSide: const BorderSide(color: Color(0xFFA7A7A7)))),
    );
  }
}
