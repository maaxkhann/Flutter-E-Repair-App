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
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AdminAppBar(
          name: 'Mr. Rehan',
          category: 'Admin',
        ),
        drawer: const AdminDrawer(),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.03,
              ),
              Text(
                'Tecnician Requests',
                style: kHead2Black,
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              AdminDashboardContainer(
                text: 'Pending Requests',
                number: '25',
                buttonColor: kButtonColor,
                textStyle: kHead1White,
                textStyle2: kBody1White,
                onTap: () => Get.to(() => const TechnicianPendingRequests()),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              AdminDashboardContainer(
                text: 'Approved Requests',
                number: '25',
                onTap: () => Get.to(() => const TechnicianApprovedRequests()),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              AdminDashboardContainer(
                text: 'Cancelled Requests',
                number: '25',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
