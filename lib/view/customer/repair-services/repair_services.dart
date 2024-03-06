import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:e_repair/model/technician_model.dart';
import 'package:e_repair/view/customer/customer_booking_detail_view.dart';
import 'package:e_repair/view/customer/repair-services/for_sale_view.dart';
import 'package:e_repair/view/customer/repair-services/mobile_repair_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RepairServices extends StatefulWidget {
  const RepairServices({super.key});

  @override
  State<RepairServices> createState() => _RepairServicesState();
}

class _RepairServicesState extends State<RepairServices> {
  int selectedIndex = 0;
  int selectIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
    return selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'E-Repair Shop Services',
            style: kHead2Black,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.02, vertical: Get.height * 0.01),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  onTapContainer('E-Repair', 0),
                  onTapContainer('Mobile-Repair', 1),
                  onTapContainer('For Sale', 2),
                ],
              ),
              selectedIndex == 0
                  ? StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('Technicians')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (!snapshot.hasData) {
                          return Text(
                            'No Services yet',
                            style: kHead2Black,
                          );
                        }
                        List<TechnicianModel> technicianModel =
                            snapshot.data!.docs.map((doc) {
                          Map<String, dynamic> data = doc.data();
                          return TechnicianModel.fromMap(data);
                        }).toList();
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: technicianModel.length,
                            itemBuilder: (context, index) {
                              final technician = technicianModel[index];
                              return Padding(
                                padding:
                                    EdgeInsets.only(top: Get.height * 0.01),
                                child: ListTile(
                                  tileColor: kButton2Color,
                                  leading: Image.network(
                                    technician.profileImage,
                                    width: Get.width * 0.15,
                                    height: Get.height * 0.12,
                                    fit: BoxFit.fill,
                                  ),
                                  title: Padding(
                                    padding: EdgeInsets.only(top: 6.h),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Service',
                                          style: kBody1Black,
                                        ),
                                        Text(
                                          'Charges',
                                          style: kBody1Black,
                                        ),
                                        InkWell(
                                          onTap: () => Get.to(() =>
                                              const CustomerBookingDetailsView()),
                                          child: Text(
                                            'Book Now',
                                            style: kBody1Transparent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  trailing: Column(
                                    children: [
                                      Text(
                                        technician.skill,
                                        style: kHead3Black,
                                      ),
                                      Text(
                                        technician.price,
                                        style: kHead3Black,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      })
                  : selectedIndex == 1
                      ? const MobileRepairServices()
                      : const ForSaleView()
            ],
          ),
        ),
      ),
    );
  }

  Widget onTapContainer(String title, int index) {
    return GestureDetector(
      onTap: () {
        selectedIndex = selectIndex(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
            color: selectedIndex == index ? kButtonColor : kButton2Color,
            border: Border.all(color: kButtonColor),
            borderRadius: BorderRadius.circular(25.r)),
        child: Text(
          title,
          style: selectedIndex == index ? kBody1White : kBody1Black,
        ),
      ),
    );
  }
}
