import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.5,
      child: Drawer(
        backgroundColor: constantColor,
        child: ListView(
          children: [
            SizedBox(
              height: Get.height * 0.02,
            ),
            CircleAvatar(
              radius: 30.r,
              child: Image.asset(
                'assets/images/image.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            const ReUsableRow(
              text: 'Home',
              iconData: Icons.home,
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            const ReUsableRow(
              text: 'Requests',
              iconData: Icons.request_page,
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            const ReUsableRow(
              text: 'Payment',
              iconData: Icons.payment,
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            const ReUsableRow(
              text: 'Logout',
              iconData: Icons.logout,
            )
          ],
        ),
      ),
    );
  }
}

class ReUsableRow extends StatelessWidget {
  final String text;
  final IconData iconData;
  const ReUsableRow({
    super.key,
    required this.text,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Get.width * 0.08),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            iconData,
            size: 22.r,
            color: kWhite,
          ),
          SizedBox(
            width: Get.width * 0.03,
          ),
          Text(
            text,
            style: kBody1White,
          )
        ],
      ),
    );
  }
}
