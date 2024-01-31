import 'package:e_repair/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/textstyles.dart';

class ConstantButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onTap;
  const ConstantButton({
    super.key,
    required this.buttonName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: Get.height * 0.075,
        decoration: BoxDecoration(
            color: kButtonColor,
            borderRadius: BorderRadius.circular(Get.width * 0.08)),
        child: Center(
          child: Text(
            buttonName,
            style: kHead2White,
          ),
        ),
      ),
    );
  }
}
