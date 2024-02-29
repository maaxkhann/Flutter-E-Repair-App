import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:e_repair/view/admin/admin-dashboard/widgets/admin_appbar.dart';
import 'package:e_repair/view/admin/admin-dashboard/widgets/admin_dashboard_container.dart';
import 'package:e_repair/view/admin/admin-dashboard/widgets/admin_drawer.dart';
import 'package:e_repair/view/admin/technician-requests/technician_pending_requests.dart';
import 'package:e_repair/view/admin/technician-requests/texhnician_approved_requests.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AdminAppBar(
          name: 'Mr. Rehan',
          category: 'Admin',
        ),
        drawer: const AdminDrawer(),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Requests').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text(
                  'No data available',
                  style: kHead2Black,
                ),
              );
            }

            final List<QueryDocumentSnapshot> docs = snapshot.data!.docs;

            String? pendingRequests;
            String? approvedRequests;
            String? cancelledRequests;

            for (final doc in docs) {
              final data = doc.data();
              if (data is Map<String, dynamic>) {
                if (data.containsKey('pending')) {
                  pendingRequests = data['pending'].toString();
                }
                if (data.containsKey('approved')) {
                  approvedRequests = data['approved'].toString();
                }
                if (data.containsKey('cancelled')) {
                  cancelledRequests = data['cancelled'].toString();
                }
              }
            }

            return Center(
              child: Column(
                children: [
                  SizedBox(height: Get.height * 0.03),
                  Text(
                    'Technician Requests',
                    style: kHead2Black,
                  ),
                  SizedBox(height: Get.height * 0.03),
                  AdminDashboardContainer(
                    text: 'Pending Requests',
                    number: pendingRequests ?? '0',
                    buttonColor: kButtonColor,
                    textStyle: kHead1White,
                    textStyle2: kBody1White,
                    onTap: () =>
                        Get.to(() => const TechnicianPendingRequests()),
                  ),
                  SizedBox(height: Get.height * 0.03),
                  AdminDashboardContainer(
                    text: 'Approved Requests',
                    number: approvedRequests ?? '0',
                    onTap: () =>
                        Get.to(() => const TechnicianApprovedRequests()),
                  ),
                  SizedBox(height: Get.height * 0.03),
                  AdminDashboardContainer(
                    text: 'Cancelled Requests',
                    number: cancelledRequests ?? '0',
                    onTap: () {},
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
