import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:e_repair/model/technician_model.dart';
import 'package:e_repair/view/admin/admin-dashboard/widgets/admin_appbar.dart';
import 'package:e_repair/view/admin/admin-dashboard/widgets/admin_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TechnicianCancelledRequests extends StatelessWidget {
  const TechnicianCancelledRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const AdminAppBar(name: 'Cancelled Requests'),
          drawer: const AdminDrawer(),
          body: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Technicians')
                  .where('status', isEqualTo: 'rejected')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                      child: Text(
                    'No Cancelled Requests',
                    style: kHead2Black,
                  ));
                }

                List<TechnicianModel> technicianData = [];
                snapshot.data!.docs.forEach((doc) {
                  technicianData.add(TechnicianModel.fromMap(doc.data()));
                });
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final TechnicianModel technician = technicianData[index];

                      return Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.01),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 24.r,
                                backgroundImage: NetworkImage(
                                    technician.profileImage.toString()),
                              ),
                              title: Text(
                                technician.name,
                                style: kHead2BlackLight,
                              ),
                              subtitle: Text(
                                'Rejected..',
                                style: kBody2Transparent,
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              })),
    );
  }
}
