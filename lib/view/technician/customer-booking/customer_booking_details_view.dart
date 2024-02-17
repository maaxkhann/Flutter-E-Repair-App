import 'package:e_repair/components/constant_button.dart';
import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:e_repair/view/technician/customer-booking/generating_invoice_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomerBookingDetailsView extends StatelessWidget {
  const CustomerBookingDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: constantColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.02,
            ),
            Center(
              child: CircleAvatar(
                radius: 35.r,
                backgroundImage: const AssetImage('assets/images/image.png'),
              ),
            ),
            Text(
              'Booking Details',
              style: kHead2White,
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              width: Get.width * 0.9,
              height: Get.height * 0.5,
              decoration: BoxDecoration(
                  color: kWhite, borderRadius: BorderRadius.circular(10.r)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const ReUsableRow(
                      text: 'Name',
                      text2: 'Mr.Azalan Malik',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const ReUsableRow(
                      text: 'Location',
                      text2: 'Karachi, Pakistan',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const ReUsableRow(
                      text: 'Category',
                      text2: 'Home Appliance',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const ReUsableRow(
                      text: 'Service',
                      text2: 'Room Cooler',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const ReUsableRow(
                      text: 'Issue',
                      text2: 'Gas Leakage',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const ReUsableRow(
                      text: 'Expected Date',
                      text2: '10-02-2024',
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    ConstantButton(
                        buttonName: 'Accept',
                        onTap: () =>
                            Get.to(() => const GeneratingInvoiceView())),
                    SizedBox(
                      height: 12.h,
                    ),
                    ConstantButton(
                        buttonName: 'Reject',
                        buttonColor: kButton2Color,
                        onTap: () {}),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReUsableRow extends StatelessWidget {
  final String text;
  final String text2;
  const ReUsableRow({
    super.key,
    required this.text,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: kBody1Black,
        ),
        Text(
          text2,
          style: kBody1Transparent,
        )
      ],
    );
  }
}
