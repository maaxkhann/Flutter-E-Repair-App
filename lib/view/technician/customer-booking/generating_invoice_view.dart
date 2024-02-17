import 'package:e_repair/components/constant_button.dart';
import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GeneratingInvoiceView extends StatelessWidget {
  const GeneratingInvoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: constantColor,
        appBar: AppBar(
          backgroundColor: constantColor,
          centerTitle: true,
          title: Text(
            'Bill Invoice',
            style: kHead2White,
          ),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: kWhite,
              )),
        ),
        body: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: Get.height * 0.02),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                width: Get.width * 0.9,
                height: Get.height * 0.54,
                decoration: BoxDecoration(
                    color: kWhite, borderRadius: BorderRadius.circular(10.r)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ReUsableRow(
                        text: 'From',
                        text2: 'Mr. Sikander',
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Karachi, Pakistan',
                          style: kBody1Transparent,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      const ReUsableRow(
                        text: 'To',
                        text2: 'Mr.Azlan Malik',
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Karachi, Pakistan',
                          style: kBody1Transparent,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      const ReUsableRow(
                        text: 'Booking ID',
                        text2: '007666666688',
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const ReUsableRow(
                        text: 'Invoice Date',
                        text2: '10 jan 2023',
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const ReUsableRow(
                        text: 'Due Date',
                        text2: '10 jan 2023',
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const ReUsableRow(
                        text: 'Status',
                        text2: 'Completed',
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const ReUsableRow(
                        text: 'Total Amount',
                        text2: 'Rs. 50000',
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      ConstantButton(buttonName: 'Pay Now', onTap: () {}),
                      SizedBox(
                        height: 12.h,
                      ),
                    ],
                  ),
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
