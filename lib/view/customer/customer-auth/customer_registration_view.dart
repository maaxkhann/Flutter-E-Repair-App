import 'package:e_repair/components/constant_button.dart';
import 'package:e_repair/components/constant_textfield.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:e_repair/view-model/customer/customer_auth_viewmodel.dart';
import 'package:e_repair/view/customer/customer-auth/customer_login_view.dart';
import 'package:e_repair/view/technician/technician-auth/widgets/location_dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CustomerRegistrationView extends StatefulWidget {
  const CustomerRegistrationView({super.key});

  @override
  State<CustomerRegistrationView> createState() =>
      _CustomerRegistrationViewState();
}

class _CustomerRegistrationViewState extends State<CustomerRegistrationView> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  List<String> location = ['Charsadda', 'Peshawar', 'Mardan'];
  final ValueNotifier<String> selectedLocation = ValueNotifier<String>('');

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<CustomerAuthViewModel>(context);
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
              Center(
                child: Stack(
                  children: [
                    authViewModel.image != null
                        ? CircleAvatar(
                            radius: 35.r,
                            backgroundImage: FileImage(authViewModel.image!))
                        : CircleAvatar(
                            radius: 35.r,
                            backgroundImage: const NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnme6H9VJy3qLGvuHRIX8IK4jRpjo_xUWlTw&usqp=CAU')),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                            onTap: () => authViewModel.pickImage(),
                            child: const Icon(Icons.camera_alt)))
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              ConstantTextField(controller: nameController, hintText: 'Name'),
              SizedBox(
                height: Get.height * 0.02,
              ),
              ConstantTextField(controller: emailController, hintText: 'Email'),
              SizedBox(
                height: Get.height * 0.02,
              ),
              ValueListenableBuilder(
                valueListenable: selectedLocation,
                builder: (context, value, child) {
                  return DropdownButtonFormField<String>(
                      hint: const Text('Location'),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFA7A7A7)),
                              borderRadius:
                                  BorderRadius.circular(Get.width * 0.06)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFA7A7A7)),
                              borderRadius:
                                  BorderRadius.circular(Get.width * 0.06))),
                      value: value.isEmpty ? null : value,
                      items: location.map((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (String? value) {
                        selectedLocation.value = value ?? '';
                      });
                },
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              ConstantTextField(
                  controller: passwordController, hintText: 'Password'),
              SizedBox(
                height: Get.height * 0.04,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
                  child: ConstantButton(
                      buttonName: 'SIGN UP',
                      onTap: () {
                        if (nameController.text.isEmpty ||
                            emailController.text.isEmpty ||
                            selectedLocation.toString().isEmpty ||
                            passwordController.text.isEmpty) {
                          Fluttertoast.showToast(msg: 'Please fill all fields');
                        } else {
                          print('aaaaaaa');
                          authViewModel.createUser(
                            context,
                            nameController.text.trim(),
                            emailController.text.trim(),
                            passwordController.text.trim(),
                            selectedLocation.value,
                          );
                        }
                        authViewModel.image == null;
                      })),
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
