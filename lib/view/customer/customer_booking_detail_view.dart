import 'package:e_repair/components/constant_button.dart';
import 'package:e_repair/components/constant_textfield.dart';
import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:e_repair/view/customer/booking_view.dart';
import 'package:e_repair/view/technician/technician-auth/widgets/location_dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomerBookingDetailsView extends StatefulWidget {
  const CustomerBookingDetailsView({super.key});

  @override
  State<CustomerBookingDetailsView> createState() =>
      _CustomerBookingDetailsViewState();
}

class _CustomerBookingDetailsViewState
    extends State<CustomerBookingDetailsView> {
  List<String> location = ['Peshawar', 'Charsadda', 'Mardan'];

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
                const ConstantTextField(hintText: 'Name'),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                LocationDropDownButton(
                    location: location, hintText: 'Location'),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const ConstantTextField(hintText: 'Category'),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const ConstantTextField(hintText: 'Service'),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const ConstantTextField(hintText: 'Issue Date'),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const ConstantTextField(hintText: 'Due Date'),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                ConstantButton(
                    buttonName: 'Submit',
                    onTap: () => Get.to(() => const BookingView()))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
