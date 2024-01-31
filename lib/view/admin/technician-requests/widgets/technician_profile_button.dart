import 'package:e_repair/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TechnicianProfileButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onTap;
  final Color? buttonColor;
  const TechnicianProfileButton({
    super.key,
    required this.buttonName,
    required this.onTap,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width * 0.4,
        height: Get.height * 0.075,
        decoration: BoxDecoration(
            color: buttonColor ?? const Color(0xFFFAFAFA),
            borderRadius: BorderRadius.circular(Get.width * 0.08)),
        child: Center(
          child: Text(
            buttonName,
            style: buttonColor != null ? kHead2White : kHead2Black,
          ),
        ),
      ),
    );
  }
}
