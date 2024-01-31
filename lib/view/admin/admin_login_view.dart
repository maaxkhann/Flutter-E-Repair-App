import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:e_repair/view/admin/admin-dashboard/admin_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../components/constant_button.dart';
import '../../components/constant_textfield.dart';

class AdminLoginView extends StatelessWidget {
  const AdminLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
        children: [
          SizedBox(
            height: Get.height * 0.1,
          ),
          CircleAvatar(
            backgroundColor: const Color(0xFFEFEFFA),
            radius: 30.r,
            child: Center(
              child: Icon(
                Icons.person,
                size: Get.height * 0.065,
                color: kButtonColor,
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          const Center(
            child: Text(
              'Sign In',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline),
            ),
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
          Padding(
            padding: EdgeInsets.only(left: Get.width * 0.02),
            child: Text(
              'Email',
              style: kBody1Black,
            ),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          const ConstantTextField(
            hintText: 'Enter Email',
          ),
          SizedBox(
            height: Get.height * 0.05,
          ),
          Padding(
            padding: EdgeInsets.only(left: Get.width * 0.02),
            child: Text(
              'Password',
              style: kBody1Black,
            ),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          const ConstantTextField(
            hintText: 'Enter Password',
          ),
          SizedBox(
            height: Get.height * 0.06,
          ),
          ConstantButton(
            buttonName: 'SIGN IN',
            onTap: () => Get.to(() => const AdminDashboard()),
          )
        ],
      ),
    );
  }
}
