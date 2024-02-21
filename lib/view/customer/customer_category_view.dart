import 'package:e_repair/components/constant_button.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class CustomerCategoryView extends StatelessWidget {
  const CustomerCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.02, vertical: Get.height * 0.04),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Select your Category to Continue',
                  style: kHead2Black,
                ),
              ),
              SizedBox(
                height: Get.height * 0.08,
              ),
              Stack(
                children: [
                  Image.asset('assets/images/category.png'),
                  Positioned(
                    left: Get.width * 0.2,
                    top: Get.height * 0.05,
                    child: Text(
                      'Electronic Services',
                      style: kHead2Black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Get.height * 0.06,
              ),
              Stack(
                children: [
                  Image.asset('assets/images/category.png'),
                  Positioned(
                    left: Get.width * 0.2,
                    top: Get.height * 0.05,
                    child: Text(
                      'Mobile Services',
                      style: kHead2Black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Get.height * 0.08,
              ),
              ConstantButton(buttonName: 'Next', onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
