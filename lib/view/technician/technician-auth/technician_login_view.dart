import 'package:e_repair/components/constant_button.dart';
import 'package:e_repair/components/constant_textfield.dart';
import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:e_repair/view-model/technician/technician_auth_viewmodel.dart';
import 'package:e_repair/view/technician/technician-auth/technician_registration_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class TechnicianLoginView extends StatefulWidget {
  const TechnicianLoginView({super.key});

  @override
  State<TechnicianLoginView> createState() => _TechnicianLoginViewState();
}

class _TechnicianLoginViewState extends State<TechnicianLoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel =
        Provider.of<TechnicianAuthViewModel>(context, listen: false);
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
          ConstantTextField(
            controller: emailController,
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
          ConstantTextField(
            controller: passwordController,
            hintText: 'Enter Password',
          ),
          SizedBox(
            height: Get.height * 0.06,
          ),
          ConstantButton(
              buttonName: 'SIGN IN',
              onTap: () {
                if (emailController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  Fluttertoast.showToast(msg: 'Please fill both fields');
                } else {
                  authViewModel.loginUser(context, emailController.text.trim(),
                      passwordController.text.trim());
                }
              }),
          TextButton(
              onPressed: () => Get.to(() => const TechnicianRegistrationView()),
              child: Text(
                'Sign Up Here!',
                style: kBody1Transparent,
              ))
        ],
      ),
    );
  }
}
