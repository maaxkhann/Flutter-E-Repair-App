import 'package:e_repair/components/constant_button.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomerFeedBackView extends StatelessWidget {
  const CustomerFeedBackView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.02, vertical: Get.height * 0.04),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                    child:
                        SvgPicture.asset('assets/images/paymentConfirm.svg')),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Text(
                  'Payment Confirm',
                  style: kHead2Black,
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Text(
                  'FeedBack!',
                  style: kHead1Black,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                RatingBar.builder(
                  itemSize: 30.r,
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Text(
                  'Very professional highly recommended',
                  style: kBody1Transparent,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: Get.height * 0.08,
                ),
                ConstantButton(buttonName: 'Logout', onTap: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
