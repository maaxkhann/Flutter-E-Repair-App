import 'package:e_repair/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/textstyles.dart';

class ConstantButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onTap;
  final Color? buttonColor;
  const ConstantButton(
      {super.key,
      required this.buttonName,
      required this.onTap,
      this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: Get.height * 0.075,
        decoration: BoxDecoration(
            color: buttonColor ?? kButtonColor,
            border: Border.all(color: constantColor),
            borderRadius: BorderRadius.circular(Get.width * 0.06)),
        child: Center(
          child: Text(
            buttonName,
            style: buttonColor != null ? kHead1Black : kHead2White,
          ),
        ),
      ),
    );
  }
}
