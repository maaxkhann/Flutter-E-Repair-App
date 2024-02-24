import 'package:e_repair/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TechnicianReview extends StatefulWidget {
  const TechnicianReview({super.key});

  @override
  State<TechnicianReview> createState() => _TechnicianReviewState();
}

class _TechnicianReviewState extends State<TechnicianReview> {
  bool isMaxLines = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Reviews',
          style: kHead2Black,
        ),
      ),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: Get.height * 0.02),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25.r,
                ),
                title: Text(
                  'Ali Khan',
                  style: kBody1Black,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Great work, very satisfied',
                      style: kBody2Transparent,
                      maxLines: isMaxLines ? 5 : 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isMaxLines = !isMaxLines;
                        });
                      },
                      child: Text(
                        isMaxLines ? 'See less' : 'See more',
                        style: kBody3Black,
                      ),
                    )
                  ],
                ),
                trailing: RatingBar.builder(
                  ignoreGestures: true,
                  itemSize: 16.r,
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
              ),
            );
          }),
    ));
  }
}
