import 'package:e_repair/components/constant_button.dart';
import 'package:e_repair/components/constant_textfield.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:e_repair/view/customer/customer_feedback_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FeedBackView extends StatelessWidget {
  const FeedBackView({super.key});

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
                  child: SvgPicture.asset('assets/images/paymentConfirm.svg')),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Text(
                'Payment Done Successfully',
                style: kHead2Black,
              ),
              SizedBox(
                height: Get.height * 0.04,
              ),
              Text(
                'How was the work?',
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
              SizedBox(
                  height: Get.height * 0.15,
                  child: const ConstantTextField(
                    hintText: 'Write Review',
                    isExpand: true,
                  )),
              SizedBox(
                height: Get.height * 0.1,
              ),
              ConstantButton(
                  buttonName: 'Submit',
                  onTap: () => Get.off(() => const CustomerFeedBackView()))
            ],
          ),
        ),
      ),
    ));
  }
}
