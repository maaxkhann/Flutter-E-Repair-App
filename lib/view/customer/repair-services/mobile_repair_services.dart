import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MobileRepairServices extends StatelessWidget {
  const MobileRepairServices({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: Get.height * 0.02),
            child: ListTile(
              tileColor: kButton2Color,
              leading: Image.asset(
                'assets/images/repair.png',
                width: Get.width * 0.15,
                height: Get.height * 0.12,
                fit: BoxFit.fill,
              ),
              title: Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Service',
                      style: kBody1Black,
                    ),
                    Text(
                      'Charges',
                      style: kBody1Black,
                    ),
                    Text(
                      'Book Now',
                      style: kBody1Transparent,
                    ),
                  ],
                ),
              ),
              trailing: Column(
                children: [
                  Text(
                    'AC Repair',
                    style: kHead3Black,
                  ),
                  Text(
                    '500',
                    style: kHead3Black,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
