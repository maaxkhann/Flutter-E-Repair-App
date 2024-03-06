import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:e_repair/model/appliance_model.dart';
import 'package:e_repair/view/customer/customer_booking_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForSaleView extends StatelessWidget {
  const ForSaleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Technicians').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final technicianDocs = snapshot.data!.docs;
        return ListView.builder(
          shrinkWrap: true,
          itemCount: technicianDocs.length,
          itemBuilder: (context, index) {
            final technicianId = technicianDocs[index].id;
            return StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Technicians')
                  .doc(technicianId)
                  .collection('Appliances')
                  .snapshots(),
              builder: (context, applianceSnapshot) {
                if (applianceSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const SizedBox.shrink();
                }
                final applianceDocs = applianceSnapshot.data!.docs;
                final appliances = applianceDocs
                    .map((doc) => ApplianceModel.fromMap(
                        doc.data() as Map<String, dynamic>))
                    .toList();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: appliances.length,
                      itemBuilder: (context, applianceIndex) {
                        final appliance = appliances[applianceIndex];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.02,
                              vertical: Get.height * 0.01),
                          child: ListTile(
                            tileColor: kButton2Color,
                            leading: Image.network(
                              appliance.image ?? '',
                              width: Get.width * 0.15,
                              height: Get.height * 0.12,
                              fit: BoxFit.fill,
                            ),
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  appliance.name ?? '',
                                  style: kHead3Black,
                                ),
                                Text(
                                  'Rs. ${appliance.price ?? ''}',
                                  style: kBody1Black,
                                ),
                                InkWell(
                                  onTap: () => Get.to(
                                      () => const CustomerBookingDetailsView()),
                                  child: Text(
                                    'Buy Now',
                                    style: kBody1Transparent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
