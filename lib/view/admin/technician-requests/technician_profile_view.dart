import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:e_repair/model/technician_model.dart';
import 'package:e_repair/view/admin/technician-requests/widgets/technician_profile_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class TechnicianProfileView extends StatelessWidget {
  final TechnicianModel technician;
  const TechnicianProfileView({super.key, required this.technician});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                padding: EdgeInsets.only(top: Get.height * 0.2),
                child: Image.network(
                  technician.profileImage,
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
                              technician.name,
                              style: kHead2Grey,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.02,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: constantColor,
                              size: 20.r,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: constraints.maxWidth * 0.01),
                              child: Text(
                                technician.location,
                                style: kHead2Grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.02,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: constraints.maxWidth * 0.015),
                              child: Text(
                                technician.price,
                                style: kHead2Grey,
                              ),
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
                          style: kHead2BlackLight,
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.02,
                        ),
                        Text(
                          technician.about,
                          style: kBody1Transparent,
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.08,
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            children: [
                              TechnicianProfileButton(
                                  buttonName: 'Accept',
                                  buttonColor: kButtonColor,
                                  onTap: () async {
                                    await FirebaseFirestore.instance
                                        .collection('Requests')
                                        .doc('Approved Requests')
                                        .set({
                                      'approved': FieldValue.increment(1)
                                    }, SetOptions(merge: true));
                                    await FirebaseFirestore.instance
                                        .collection('Requests')
                                        .doc('Pending Requests')
                                        .set({
                                      'pending': FieldValue.increment(-1)
                                    }, SetOptions(merge: true));

                                    TechnicianModel technician =
                                        this.technician;
                                    await FirebaseFirestore.instance
                                        .collection('Technicians')
                                        .where('name',
                                            isEqualTo: technician.name)
                                        .get()
                                        .then((querySnapshot) {
                                      querySnapshot.docs.forEach((doc) async {
                                        await doc.reference
                                            .update({'status': 'approved'});
                                        Fluttertoast.showToast(
                                            msg: 'Request Accepted');
                                      });
                                    });
                                  }),
                              SizedBox(
                                width: Get.width * 0.02,
                              ),
                              TechnicianProfileButton(
                                  buttonName: 'Reject', onTap: () {})
                            ],
                          ),
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
