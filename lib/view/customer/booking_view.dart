import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_repair/components/constant_button.dart';
import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:e_repair/model/booking_model.dart';
import 'package:e_repair/view/chat_view.dart';
import 'package:e_repair/view/technician/customer-booking/generating_invoice_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingView extends StatelessWidget {
  const BookingView({Key? key});

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
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Customers')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('Technician-Booking')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text(
                  'No Bookings yet',
                  style: kHead2Black,
                ),
              );
            }
            List<BookingModel> bookingModel = snapshot.data!.docs
                .map((doc) =>
                    BookingModel.fromMap(doc.data() as Map<String, dynamic>))
                .toList();

            return Padding(
              padding: EdgeInsets.only(
                left: Get.width * 0.02,
                right: Get.width * 0.02,
                bottom: Get.height * 0.012,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: bookingModel.length,
                      itemBuilder: (context, index) {
                        final booking = bookingModel[index];
                        return Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                  color: kButton2Color,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/images/repair.png',
                                      height: Get.height * 0.12,
                                      width: Get.width * 0.16,
                                      fit: BoxFit.fill,
                                    ),
                                    SizedBox(width: Get.width * 0.02),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                              booking.service,
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
                                              booking.issue,
                                              style: kHead3Black,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.015,
                                        ),
                                        Text(
                                          'Upcoming ${booking.dueDate}',
                                          style: kBody1Black,
                                        ),
                                        InkWell(
                                          onTap: () =>
                                              Get.to(() => const ChatView()),
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
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  ConstantButton(
                    buttonName: 'View Bill',
                    onTap: () => Get.to(() => const GeneratingInvoiceView()),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
