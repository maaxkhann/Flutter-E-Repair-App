import 'package:e_repair/components/constant_button.dart';
import 'package:e_repair/components/constant_textfield.dart';
import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:e_repair/view/technician/technician-auth/widgets/location_dropdown_button.dart';
import 'package:e_repair/view/technician/technician-requests/technician_waiting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TechnicianRegistrationView extends StatelessWidget {
  const TechnicianRegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> location = ['Charsadda', 'Peshawar', 'Mardan'];
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
          child: ListView(
            children: [
              SizedBox(
                height: Get.height * 0.02,
              ),
              SvgPicture.asset(
                'assets/images/splash.svg',
                width: Get.width * 0.1,
                height: Get.height * 0.1,
              ),
              Center(
                child: Text(
                  'Welcome To E-Repair Shop',
                  style: kHead2Black,
                  maxLines: 2,
                ),
              ),
              Center(
                child: Text(
                  'Technician Sign Up !',
                  style: kBody1Transparent,
                  maxLines: 2,
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                children: [
                  const Flexible(child: ConstantTextField(hintText: 'name')),
                  SizedBox(
                    width: Get.width * 0.02,
                  ),
                  const Flexible(child: ConstantTextField(hintText: 'Email'))
                ],
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Row(
                children: [
                  const Flexible(child: ConstantTextField(hintText: 'Skill')),
                  SizedBox(
                    width: Get.width * 0.02,
                  ),
                  Flexible(
                      child: LocationDropDownButton(
                          location: location, hintText: 'Location'))
                ],
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Row(
                children: [
                  const Flexible(
                      child: ConstantTextField(hintText: 'Average Price')),
                  SizedBox(
                    width: Get.width * 0.02,
                  ),
                  const Flexible(child: ConstantTextField(hintText: 'Password'))
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              const ConstantTextField(hintText: 'About Yourself'),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Container(
                width: double.infinity,
                height: Get.height * 0.12,
                decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(Get.width * 0.06),
                    border: Border.all(color: const Color(0xFFA7A7A7))),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.upload,
                        color: const Color(0xFFA7A7A7),
                        size: 30.r,
                      ),
                      SizedBox(
                        width: Get.width * 0.02,
                      ),
                      Text(
                        'Upload Profile image',
                        style: kBody1Transparent,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
                  child: ConstantButton(
                      buttonName: 'SIGN UP',
                      onTap: () =>
                          Get.to(() => const TechnicianWaitingView()))),
              SizedBox(
                height: Get.height * 0.016,
              ),
              Center(
                child: Text(
                  'Already have an account?',
                  style: kBody1Black,
                ),
              ),
              Center(
                child: Text(
                  'Sign in Here!',
                  style: kBody1Transparent,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
