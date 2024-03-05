import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:e_repair/view/technician/technician-dashboard/add_sale_appliances.dart';
import 'package:e_repair/view/technician/technician-dashboard/list_appliances.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TechnicianDrawer extends StatelessWidget {
  const TechnicianDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.6,
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
            ReUsableRow(
              text: 'Add Appliances',
              iconData: Icons.home,
              onTap: () => Get.to(() => const AddSaleAppliances()),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            ReUsableRow(
              text: 'Appliances List',
              iconData: Icons.request_page,
              onTap: () => Get.to(() => const ListAppliancesView()),
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
  final VoidCallback? onTap;
  const ReUsableRow(
      {super.key, required this.text, required this.iconData, this.onTap});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: InkWell(
        onTap: onTap,
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
      ),
    );
  }
}
