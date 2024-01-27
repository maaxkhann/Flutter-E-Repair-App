import 'package:e_repair/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../components/select_user_button.dart';

class SelectUserView extends StatelessWidget {
  const SelectUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.12,
            ),
            Center(
              child: SvgPicture.asset(
                'assets/images/splash.svg',
                width: Get.width * 0.3,
                height: Get.height * 0.17,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            SelectUserButton(
              text: 'Admin',
              buttonColor: const Color(0xFF518393),
              textStyle: kHead1White,
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            const SelectUserButton(
              text: 'Technician',
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            const SelectUserButton(
              text: 'Customer',
            ),
          ],
        ),
      ),
    );
  }
}
