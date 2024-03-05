import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ListAppliancesView extends StatelessWidget {
  const ListAppliancesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kButtonColor,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'Technician Dashboard',
            style: kHead2White,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'List of Sale Appliance',
                      style: kHead2Black,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Name',
                        style: kBody1Black,
                      ),
                      Text(
                        'Price',
                        style: kBody1Black,
                      ),
                      Text(
                        'Image',
                        style: kBody1Black,
                      ),
                      Text(
                        'Actions',
                        style: kBody1Black,
                      ),
                    ],
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Fridge',
                                style: kBody2Black,
                              ),
                              Text(
                                '5000',
                                style: kBody2Black,
                              ),
                              Container(
                                width: Get.width * 0.1,
                                height: Get.height * 0.055,
                                color: kBlack,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.edit),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: const Icon(Icons.delete),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                ],
              )),
        ),
      ),
    );
  }
}
