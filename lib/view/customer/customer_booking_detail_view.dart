import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_repair/components/constant_button.dart';
import 'package:e_repair/components/constant_textfield.dart';
import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:e_repair/view/customer/booking_view.dart';
import 'package:e_repair/view/technician/technician-auth/widgets/location_dropdown_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CustomerBookingDetailsView extends StatefulWidget {
  const CustomerBookingDetailsView({super.key});

  @override
  State<CustomerBookingDetailsView> createState() =>
      _CustomerBookingDetailsViewState();
}

class _CustomerBookingDetailsViewState
    extends State<CustomerBookingDetailsView> {
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final serviceController = TextEditingController();
  final issueController = TextEditingController();
  final dueDateController = TextEditingController();
  List<String> location = ['Peshawar', 'Charsadda', 'Mardan'];
  final ValueNotifier<String> selectedLocation = ValueNotifier<String>('');
  @override
  void dispose() {
    nameController.dispose();
    selectedLocation.dispose();
    categoryController.dispose();
    serviceController.dispose();
    issueController.dispose();
    dueDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kButtonColor,
      appBar: AppBar(
        backgroundColor: kButtonColor,
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kWhite,
            )),
        title: Text(
          'Enter Details',
          style: kHead1White,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.03, vertical: Get.height * 0.02),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.02, vertical: Get.height * 0.03),
          decoration: BoxDecoration(
              color: kWhite, borderRadius: BorderRadius.circular(15.r)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ConstantTextField(controller: nameController, hintText: 'Name'),
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
                    controller: categoryController, hintText: 'Category'),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ConstantTextField(
                    controller: serviceController, hintText: 'Service'),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ConstantTextField(
                    controller: issueController, hintText: 'Issue'),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ConstantTextField(
                    controller: dueDateController, hintText: 'Due Date'),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                ConstantButton(
                    buttonName: 'Submit',
                    onTap: () async {
                      if (nameController.text.isEmpty ||
                          selectedLocation.value.isEmpty ||
                          categoryController.text.isEmpty ||
                          serviceController.text.isEmpty ||
                          issueController.text.isEmpty ||
                          dueDateController.text.isEmpty) {
                        Fluttertoast.showToast(msg: 'Please fill all fields');
                      } else {
                        try {
                          DocumentReference bookingref = FirebaseFirestore
                              .instance
                              .collection('Customers')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .collection('Technician-Booking')
                              .doc();
                          await bookingref.set({
                            'name': nameController.text.trim(),
                            'location': selectedLocation.value,
                            'category': categoryController.text.trim(),
                            'service': serviceController.text.trim(),
                            'issue': issueController.text.trim(),
                            'dueDate': dueDateController.text.trim(),
                            'docId': bookingref.id
                          });
                          Get.off(() => const BookingView());
                          Fluttertoast.showToast(msg: 'Booking added');
                        } catch (e) {
                          Fluttertoast.showToast(msg: 'Something went wrong');
                          rethrow;
                        }
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
