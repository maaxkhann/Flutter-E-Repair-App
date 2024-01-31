import 'package:e_repair/components/constant_button.dart';
import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:e_repair/view/technician/technician-auth/technician_login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TechnicianWaitingView extends StatelessWidget {
  const TechnicianWaitingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Get.height * 0.1),
          child: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: constantColor,
            title: Text(
              'Profile created succsessfully Wait While your request approve by admin',
              style: kBody1White,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        body: Stack(
          children: [
            Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.fill,
              height: Get.height * 0.5,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: Get.height * 0.09),
                child: Image.asset(
                  'assets/images/image2.png',
                  width: Get.width * 0.4,
                  height: Get.height * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.04,
                      vertical: Get.height * 0.012),
                  width: double.infinity,
                  height: Get.height * 0.52,
                  decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Get.width * 0.04),
                          topRight: Radius.circular(Get.width * 0.04))),
                  child: LayoutBuilder(builder: (context, constraints) {
                    return ListView(
                      children: [
                        Text(
                          'E Repair Shop',
                          style: kHead1Black,
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Mr. Sikander',
                              style: kHead1Grey,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: constraints.maxWidth * 0.02),
                                  child: const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: constraints.maxWidth * 0.02),
                                  child: Text(
                                    '4.8',
                                    style: kBody2Transparent,
                                  ),
                                ),
                                Text(
                                  '(300)',
                                  style: kBody2Transparent,
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.02,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: constantColor,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: constraints.maxWidth * 0.01),
                              child: Text(
                                'Karachi,Pakistan',
                                style: kHead2Grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: Get.width * 0.015),
                          child: Row(
                            children: [
                              Text(
                                '20\$',
                                style: kHead2Grey,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: constraints.maxWidth * 0.02),
                                child: Text(
                                  'Per day',
                                  style: kBody2Transparent,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.02,
                        ),
                        const Divider(
                          thickness: 0.5,
                          color: constantColor,
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.02,
                        ),
                        Text(
                          'About me',
                          style: kHead1Black,
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.02,
                        ),
                        Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                          style: kBody1Transparent,
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.08,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.06),
                          child: ConstantButton(
                              buttonName: 'Pending',
                              buttonColor: Colors.white,
                              onTap: () =>
                                  Get.to(() => const TechnicianLoginView())),
                        )
                      ],
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}
