import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminDashboardContainer extends StatelessWidget {
  final String text;
  final String number;
  final Color? buttonColor;
  final TextStyle? textStyle;
  final TextStyle? textStyle2;
  final VoidCallback onTap;
  const AdminDashboardContainer(
      {super.key,
      required this.text,
      this.buttonColor,
      this.textStyle,
      required this.number,
      this.textStyle2,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
          width: Get.width * 0.5,
          height: Get.height * 0.14,
          decoration: BoxDecoration(
              color: buttonColor ?? kButton2Color,
              borderRadius: BorderRadius.circular(Get.width * 0.02)),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    number,
                    style: textStyle ?? kHead1Black,
                  ),
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        text,
                        style: textStyle2 ?? kBody1Black,
                      ),
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }
}
