import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_repair/components/constant_textfield.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:e_repair/view/customer/technicians-list/technician_detail_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TechniciansListView extends StatelessWidget {
  const TechniciansListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios)),
          title: Text(
            'Hello, What needs a fix?',
            style: kHead2Black,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.02, vertical: Get.height * 0.01),
          child: Column(
            children: [
              const ConstantTextField(hintText: 'Search'),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Special Offers',
                    style: kHead2Black,
                  ),
                  Text(
                    'View All',
                    style: kBody1Black,
                  )
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              CarouselSlider(
                items: const [
                  'assets/images/category.png',
                  'assets/images/category.png'
                ].map((i) {
                  return Builder(builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(left: Get.width * 0.03),
                      child: GestureDetector(
                        onTap: () =>
                            Get.to(() => const TechnicianDetailProfile()),
                        child: Stack(
                          children: [
                            Image.asset(i),
                            Center(
                              child: Text(
                                'AC Repair shop',
                                style: kHead2Black,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
                }).toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  height: Get.height * 0.14,
                ),
              ),
              SizedBox(
                height: Get.height * 0.012,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Appliances',
                    style: kHead2Black,
                  ),
                  Text(
                    'View All',
                    style: kBody1Black,
                  )
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 25.r,
                      ),
                      Text(
                        'Fridge',
                        style: kBody2Black,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 25.r,
                      ),
                      Text(
                        'Fridge',
                        style: kBody2Black,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 25.r,
                      ),
                      Text(
                        'Fridge',
                        style: kBody2Black,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 25.r,
                      ),
                      Text(
                        'Fridge',
                        style: kBody2Black,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
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
                height: Get.height * 0.02,
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
          ),
        ),
      ),
    );
  }
}
