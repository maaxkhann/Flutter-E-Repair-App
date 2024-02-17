import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: constantColor,
          centerTitle: true,
          title: Text(
            'Chats',
            style: kHead2White,
          ),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: kWhite,
              )),
        ),
        body: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: ListTile(
                  tileColor: kButton2Color,
                  leading: CircleAvatar(
                    radius: 26.r,
                    backgroundImage:
                        const AssetImage('assets/images/image.png'),
                  ),
                  title: Text(
                    'Azlan Malik',
                    style: kBody1Black,
                  ),
                  subtitle: Text(
                    'Hello',
                    style: kBody2Transparent,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Text(
                    '6:28 PM',
                    style: kBody2Transparent,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
