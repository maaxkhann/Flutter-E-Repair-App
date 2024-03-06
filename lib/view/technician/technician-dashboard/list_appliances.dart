import 'package:e_repair/components/constant_textfield.dart';
import 'package:e_repair/model/appliance_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ndialog/ndialog.dart';

class ListAppliancesView extends StatefulWidget {
  const ListAppliancesView({super.key});

  @override
  State<ListAppliancesView> createState() => _ListAppliancesViewState();
}

class _ListAppliancesViewState extends State<ListAppliancesView> {
  final priceController = TextEditingController();

  @override
  void dispose() {
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kButtonColor,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'Technician Dashboard',
            style: kHead2White,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'List of Sale Appliances',
                style: kHead2Black,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Technicians')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('Appliances')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data == null) {
                    return Center(
                      child: Text(
                        'No listed items',
                        style: kHead2Black,
                      ),
                    );
                  }

                  List<ApplianceModel> appliances =
                      snapshot.data!.docs.map((doc) {
                    Map<String, dynamic> data =
                        doc.data() as Map<String, dynamic>;
                    return ApplianceModel.fromMap(data);
                  }).toList();

                  return SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: Get.height * 0.02),
                      child: Column(
                        children: [
                          SizedBox(height: Get.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Name',
                                style: kBody1Black,
                              ),
                              Text(
                                'Price',
                                style: kBody1Black,
                              ),
                              Text(
                                'Image',
                                style: kBody1Black,
                              ),
                              Text(
                                'Actions',
                                style: kBody1Black,
                              ),
                            ],
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: appliances.length,
                            itemBuilder: (context, index) {
                              ApplianceModel appliance = appliances[index];
                              return Padding(
                                padding: EdgeInsets.only(top: 10.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      appliance.name ?? '',
                                      style: kBody2Black,
                                    ),
                                    Text(
                                      appliance.price ?? '',
                                      style: kBody2Black,
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.1,
                                      height: Get.height * 0.058,
                                      child: Image.network(
                                        appliance.image ?? '',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              AlertDialog(
                                                title: Text(
                                                  'Update price',
                                                  style: kBody2Black,
                                                ),
                                                content: ConstantTextField(
                                                    controller: priceController,
                                                    hintText: 'New Price'),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () =>
                                                          Get.back(),
                                                      child:
                                                          const Text('Cancel')),
                                                  TextButton(
                                                      onPressed: () async {
                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'Technicians')
                                                            .doc(FirebaseAuth
                                                                .instance
                                                                .currentUser!
                                                                .uid)
                                                            .collection(
                                                                'Appliances')
                                                            .doc(
                                                                appliance.docId)
                                                            .update({
                                                          'price':
                                                              priceController
                                                                  .text
                                                                  .trim()
                                                        });
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                'Price updated');
                                                        Get.back();
                                                      },
                                                      child:
                                                          const Text('Update'))
                                                ],
                                              ).show(context);
                                            },
                                            child: const Icon(Icons.edit)),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.w),
                                          child: InkWell(
                                              onTap: () {
                                                AlertDialog(
                                                  title: Text(
                                                    'Are you sure to delete!',
                                                    style: kBody2Black,
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () =>
                                                            Get.back(),
                                                        child: const Text(
                                                            'Cancel')),
                                                    TextButton(
                                                        onPressed: () async {
                                                          await FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'Technicians')
                                                              .doc(FirebaseAuth
                                                                  .instance
                                                                  .currentUser!
                                                                  .uid)
                                                              .collection(
                                                                  'Appliances')
                                                              .doc(appliance
                                                                  .docId)
                                                              .delete();

                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  'Appliance deleted');
                                                          Get.back();
                                                        },
                                                        child: const Text(
                                                            'Delete'))
                                                  ],
                                                ).show(context);
                                              },
                                              child: const Icon(Icons.delete)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
