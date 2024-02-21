import 'package:e_repair/components/constant_button.dart';
import 'package:e_repair/components/constant_textfield.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:e_repair/view/customer/customer-auth/customer_login_view.dart';
import 'package:e_repair/view/technician/technician-auth/widgets/location_dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomerRegistrationView extends StatefulWidget {
  const CustomerRegistrationView({super.key});

  @override
  State<CustomerRegistrationView> createState() =>
      _CustomerRegistrationViewState();
}

class _CustomerRegistrationViewState extends State<CustomerRegistrationView> {
  List<String> location = ['Charsadda', 'Peshawar', 'Mardan'];
  @override
  Widget build(BuildContext context) {
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
                  'Customer Sign Up !',
                  style: kBody1Transparent,
                  maxLines: 2,
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              const ConstantTextField(hintText: 'Name'),
              SizedBox(
                height: Get.height * 0.02,
              ),
              const ConstantTextField(hintText: 'Email'),
              SizedBox(
                height: Get.height * 0.02,
              ),
              LocationDropDownButton(location: location, hintText: 'Location'),
              SizedBox(
                height: Get.height * 0.02,
              ),
              const ConstantTextField(hintText: 'Password'),
              SizedBox(
                height: Get.height * 0.04,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
                  child: ConstantButton(
                      buttonName: 'SIGN UP',
                      onTap: () => Get.to(() => const CustomerLoginView()))),
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
                child: InkWell(
                  onTap: () => Get.to(() => const CustomerLoginView()),
                  child: Text(
                    'Sign in Here!',
                    style: kBody1Transparent,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
