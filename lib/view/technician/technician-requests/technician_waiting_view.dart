import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_repair/components/constant_button.dart';
import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:e_repair/model/technician_model.dart';
import 'package:e_repair/view-model/technician/technician_auth_viewmodel.dart';
import 'package:e_repair/view/technician/technician-auth/technician_login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class TechnicianWaitingView extends StatefulWidget {
  const TechnicianWaitingView({Key? key});

  @override
  State<TechnicianWaitingView> createState() => _TechnicianWaitingViewState();
}

class _TechnicianWaitingViewState extends State<TechnicianWaitingView> {
  @override
  Widget build(BuildContext context) {
    final authViewModel =
        Provider.of<TechnicianAuthViewModel>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Get.height * 0.09),
          child: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: constantColor,
            title: Text(
              'Profile created successfully. Wait while your request is approved by admin',
              style: kBody1White,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: FirebaseFirestore.instance
              .collection('Technicians')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.data() == null) {
              return const Center(child: Text(''));
            } else {
              TechnicianModel technician = TechnicianModel.fromMap(
                snapshot.data!.data() as Map<String, dynamic>,
              );
              return buildTechnicianProfile(context, technician);
            }
          },
        ),
      ),
    );
  }

  Widget buildTechnicianProfile(
      BuildContext context, TechnicianModel technician) {
    return Stack(
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
              vertical: Get.height * 0.012,
            ),
            width: double.infinity,
            height: Get.height * 0.52,
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Get.width * 0.04),
                topRight: Radius.circular(Get.width * 0.04),
              ),
            ),
            child: technician != null
                ? LayoutBuilder(
                    builder: (context, constraints) {
                      return ListView(
                        children: [
                          Text(
                            'E Repair Shop',
                            style: kHead1Black,
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.04,
                          ),
                          Text(
                            technician.name,
                            style: kHead1Grey,
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
                                  left: constraints.maxWidth * 0.01,
                                ),
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
                          Padding(
                            padding: EdgeInsets.only(
                              left: Get.width * 0.015,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  technician!.price,
                                  style: kHead2Grey,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: constraints.maxWidth * 0.02,
                                  ),
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
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.06,
                            ),
                            child: ConstantButton(
                              buttonName: technician.status == 'pending'
                                  ? 'Pending'
                                  : technician.status == 'approved'
                                      ? 'Sign In'
                                      : 'Rejected',
                              buttonColor: Colors.white,
                              onTap: () => technician.status == 'approved'
                                  ? Get.to(() => const TechnicianLoginView())
                                  : null,
                            ),
                          ),
                        ],
                      );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ),
      ],
    );
  }
}
