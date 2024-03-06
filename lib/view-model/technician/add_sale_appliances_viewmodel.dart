import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_repair/model/appliance_model.dart';
import 'package:e_repair/view/technician/technician-dashboard/list_appliances.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndialog/ndialog.dart';

class AddSaaleAppliancesViewModel with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  File? image;
  final picker = ImagePicker();
  String? imageUrl;

  Future pickImage() async {
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      notifyListeners();
    } else {
      Fluttertoast.showToast(msg: 'No image selected');
    }
  }

  Future storeImage() async {
    //   isUpload = true;
    // notifyListeners();
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    try {
      Reference storageRef = firebaseStorage.ref().child('Appliances/');
      UploadTask uploadTask = storageRef.putFile(image!);
      await Future.value(uploadTask);
      imageUrl = await storageRef.getDownloadURL();

      //   Fluttertoast.showToast(msg: 'Image Uploaded');

      // isUpload = false;
      //  notifyListeners();
    } catch (e) {
      Fluttertoast.showToast(msg: 'Something went wrong');
      //  isUpload = false;
      //  notifyListeners();
      rethrow;
    }
  }

  Future<void> addAppliance(
      BuildContext context, String name, String price) async {
    ProgressDialog progressDialog = ProgressDialog(context,
        title: const Text('Appliance adding'),
        message: const Text('Please wait'));
    progressDialog.show();
    try {
      storeImage();
      DocumentReference applianceRef = firestore
          .collection('Technicians')
          .doc(auth.currentUser!.uid)
          .collection('Appliances')
          .doc();

      await applianceRef.set({
        'name': name,
        'price': price,
        'image': imageUrl,
        'docId': applianceRef.id,
        'uId': auth.currentUser!.uid
      });
      progressDialog.dismiss();
      Fluttertoast.showToast(msg: 'Appliance added');
      Get.to(() => const ListAppliancesView());
    } catch (e) {
      progressDialog.dismiss();
      Fluttertoast.showToast(msg: 'Something went wrong');
      rethrow;
    }
  }
}
