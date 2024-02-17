import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:e_repair/view/technician/chat/chats_view.dart';
import 'package:e_repair/view/technician/customer-booking/customer_booking_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomerBookingView extends StatelessWidget {
  const CustomerBookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: constantColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Bookings',
            style: kHead1White,
          ),
          actions: [
            IconButton(
                onPressed: () => Get.to(() => const ChatsView()),
                icon: const Icon(
                  Icons.chat_bubble,
                  color: kWhite,
                ))
          ],
        ),
        body: Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    child: ListTile(
                      onTap: () =>
                          Get.to(() => const CustomerBookingDetailsView()),
                      tileColor: kButton2Color,
                      leading: CircleAvatar(
                        radius: 28.r,
                        backgroundImage:
                            const AssetImage('assets/images/image.png'),
                      ),
                      title: Padding(
                        padding: EdgeInsets.only(top: 4.h),
                        child: Text(
                          'Azlan Malik',
                          style: kHead2BlackLight,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: constantColor,
                                size: 20.r,
                              ),
                              Text(
                                'Karachi,Pakistan',
                                style: kBody2Black,
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.w),
                            child: Text(
                              'pending',
                              style: kBody2Transparent,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })),
      ),
    );
  }
}
