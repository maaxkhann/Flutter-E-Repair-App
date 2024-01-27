import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/textstyles.dart';

class SelectUserButton extends StatelessWidget {
  final String text;
  final Color? buttonColor;
  final TextStyle? textStyle;
  const SelectUserButton(
      {super.key, required this.text, this.buttonColor, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
        width: Get.width * 0.56,
        height: Get.height * 0.09,
        decoration: BoxDecoration(
            color: buttonColor ?? kButton2Color,
            borderRadius: BorderRadius.circular(Get.width * 0.02)),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.person,
                  size: constraints.maxHeight * 0.5,
                  color: textStyle == null ? const Color(0xFFA7A7A7) : kWhite,
                ),
                SizedBox(
                  width: constraints.maxWidth * 0.05,
                ),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      text,
                      style: textStyle ?? kHead1Grey,
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
