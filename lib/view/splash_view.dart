import 'dart:async';
import 'package:e_repair/constants/textstyles.dart';
import 'package:e_repair/view/select_user_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Get.off(() => const SelectUserView()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/splash.svg',
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Text(
              'Professional Service at Your doorstep',
              textAlign: TextAlign.center,
              style: kHead2Black,
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Text(
              'Get Service Done By Trained Technician',
              style: kBody1Transparent,
            ),
          ],
        ),
      ),
    );
  }
}
