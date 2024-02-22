import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TechnicianDetailProfile extends StatelessWidget {
  const TechnicianDetailProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg.png',
            fit: BoxFit.fill,
            height: Get.height * 0.6,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: Get.height * 0.06),
              child: Image.asset(
                'assets/images/image2.png',
                width: Get.width * 0.4,
                height: Get.height * 0.3,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.04, vertical: Get.height * 0.012),
                width: double.infinity,
                height: Get.height * 0.62,
                decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Get.width * 0.04),
                        topRight: Radius.circular(Get.width * 0.04))),
                child: LayoutBuilder(builder: (context, constraints) {
                  return ListView(
                    children: [
                      Text(
                        'E Repair Shop',
                        style: kHead1Black,
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.015,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.timelapse,
                            size: 18.r,
                            color: kButtonColor,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            'Now open until 8PM',
                            style: kBody2Transparent,
                          ),
                          const Spacer(),
                          Text(
                            'Reviews',
                            style: kBody3Black,
                          )
                        ],
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.015,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 18.r,
                            color: kButtonColor,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            'Karachi,Pakistan',
                            style: kBody2Transparent,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      Text(
                        'Delivery Fee',
                        style: kBody1Black,
                      ),
                      Text(
                        'Delivery fee charged base on distance and time of day.',
                        style: kBody3Black,
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      Text(
                        'Service Fee',
                        style: kBody1Black,
                      ),
                      Text(
                        'This fee goes on providing you better customer care and app experience.',
                        style: kBody3Black,
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Services',
                            style: kHead2Black,
                          ),
                          Text(
                            'View All',
                            style: kBody1Black,
                          )
                        ],
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/repair.png',
                                width: Get.width * 0.45,
                              ),
                              Text(
                                'E-Repair Services',
                                style: kBody1Black,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/repair.png',
                                width: Get.width * 0.45,
                              ),
                              Text(
                                'Mobile Services',
                                style: kBody1Black,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  );
                })),
          ),
          Positioned(
            left: 8.r,
            top: 8.r,
            child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back_ios,
                )),
          ),
        ],
      ),
    ));
  }
}
