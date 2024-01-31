import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:e_repair/view/admin/admin-dashboard/widgets/admin_appbar.dart';
import 'package:e_repair/view/admin/admin-dashboard/widgets/admin_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TechnicianApprovedRequests extends StatelessWidget {
  const TechnicianApprovedRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AdminAppBar(name: 'Approved Requests'),
        drawer: const AdminDrawer(),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: Get.height * 0.01),
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 22.r,
                      child: Image.asset(
                        'assets/images/image.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      'Sikander',
                      style: kHead2BlackLight,
                    ),
                    subtitle: Text(
                      'Approved',
                      style: kBody2Transparent,
                    ),
                    trailing: Column(
                      children: [
                        const Icon(
                          Icons.more_time,
                          color: constantColor,
                        ),
                        Text(
                          '10m',
                          style: kBody1Transparent,
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
