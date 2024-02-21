import 'dart:async';
import 'package:e_repair/components/constant_button.dart';
import 'package:e_repair/components/constant_textfield.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:e_repair/view/customer/customer_category_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomerLocationView extends StatefulWidget {
  const CustomerLocationView({super.key});

  @override
  State<CustomerLocationView> createState() => _CustomerLocationViewState();
}

class _CustomerLocationViewState extends State<CustomerLocationView> {
  Completer<GoogleMapController> controller = Completer();
  static const CameraPosition cameraPosition =
      CameraPosition(target: LatLng(34.149433, 71.742783), zoom: 14);
  List<Marker> markers = [];
  List<Marker> markersList = [
    const Marker(
        markerId: MarkerId('1'),
        position: LatLng(34.149433, 71.742783),
        infoWindow: InfoWindow(title: 'My Position'))
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    markers.addAll(markersList);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.02, vertical: Get.height * 0.04),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Select your location to Continue',
                    style: kHead2Black,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const ConstantTextField(hintText: 'Street, Postal Code'),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                SizedBox(
                  width: double.infinity,
                  height: Get.height * 0.5,
                  child: GoogleMap(
                    initialCameraPosition: cameraPosition,
                    onMapCreated: (GoogleMapController googleMapController) {
                      controller.complete(googleMapController);
                    },
                    markers: Set<Marker>.of(markers),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                ConstantButton(
                    buttonName: 'Next',
                    onTap: () => Get.to(() => const CustomerCategoryView()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
