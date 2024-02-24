import 'package:e_repair/components/constant_button.dart';
import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:e_repair/view/chat_view.dart';
import 'package:e_repair/view/technician/customer-booking/generating_invoice_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kButtonColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'My Bookings',
            style: kHead1White,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.02, vertical: Get.height * 0.02),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                    color: kButton2Color,
                    borderRadius: BorderRadius.circular(8.r)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/repair.png',
                      height: Get.height * 0.15,
                      width: Get.width * 0.16,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Service',
                              style: kBody1Black,
                            ),
                            SizedBox(
                              width: Get.width * 0.35,
                            ),
                            Text(
                              'AC',
                              style: kHead3Black,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Issue',
                              style: kBody1Black,
                            ),
                            SizedBox(
                              width: Get.width * 0.35,
                            ),
                            Text(
                              'Gas leak',
                              style: kHead3Black,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.015,
                        ),
                        Text(
                          'Upcoming 22 Jan, 2024',
                          style: kBody1Black,
                        ),
                        InkWell(
                          onTap: () => Get.to(() => const ChatView()),
                          child: Text(
                            'Message',
                            style: kBody2Transparent,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Spacer(),
              ConstantButton(
                  buttonName: 'View Bill',
                  onTap: () => Get.to(() => const GeneratingInvoiceView()))
            ],
          ),
        ),
      ),
    );
  }
}
