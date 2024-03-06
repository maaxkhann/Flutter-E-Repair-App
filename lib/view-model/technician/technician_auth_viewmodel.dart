import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_repair/view/technician/customer-booking/customer_booking_view.dart';
import 'package:e_repair/view/technician/technician-requests/technician_waiting_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndialog/ndialog.dart';

class TechnicianAuthViewModel with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  File? image;
  final picker = ImagePicker();
  String? imageUrl;
  // bool isUpload = false;

  Future pickImage() async {
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      notifyListeners();
    } else {
      Fluttertoast.showToast(msg: 'No image selected');
    }
  }

  Future storeImage(String email) async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    try {
      Reference storageRef =
          firebaseStorage.ref().child('profileImages/$email');
      UploadTask uploadTask = storageRef.putFile(image!);
      await Future.value(uploadTask);
      imageUrl = await storageRef.getDownloadURL();
    } catch (e) {
      Fluttertoast.showToast(msg: 'Something went wrong');

      rethrow;
    }
  }

  Future<void> createUser(
      BuildContext context,
      String name,
      String email,
      String password,
      String skill,
      String price,
      String location,
      String about) async {
    ProgressDialog progressDialog = ProgressDialog(context,
        title: const Text('Signing Up'), message: const Text('Please wait'));
    progressDialog.show();

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        String uId = auth.currentUser!.uid;
        progressDialog.dismiss();
        storeImage(email).then((value) async {
          DocumentReference documentReference =
              firestore.collection('Technicians').doc(uId);
          await documentReference.set({
            'name': name,
            'email': email,
            'skill': skill,
            'price': price,
            'location': location,
            'about': about,
            'profileImage': imageUrl ?? '',
            'status': 'pending',
            'userId': uId
          });
          await firestore.collection('Requests').doc('Pending Requests').set(
              {'pending': FieldValue.increment(1)}, SetOptions(merge: true));
        });

        Fluttertoast.showToast(msg: 'Sign Up Successfully');
        Get.to(() => const TechnicianWaitingView());
      }
    } on FirebaseAuthException catch (e) {
      progressDialog.dismiss();
      if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: 'Email already in use');
        return;
      } else if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'Password is weak');
        return;
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: 'Invalid Password');
      } else if (e.code == 'invalid-email') {
        Fluttertoast.showToast(msg: 'Invalid Email');
      } else if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: 'User not found');
      }
    } catch (e) {
      progressDialog.dismiss();
      Fluttertoast.showToast(msg: 'Something went wrong');
    }
  }

  Future<void> loginUser(
      BuildContext context, String email, String password) async {
    ProgressDialog progressDialog = ProgressDialog(context,
        title: const Text('Signing In'), message: const Text('Please wait'));
    progressDialog.show();
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        progressDialog.dismiss();
        Fluttertoast.showToast(msg: 'Login Successfully');
        // final SharedPreferences sharedPreferences =
        //     await SharedPreferences.getInstance();
        // sharedPreferences.setBool('isLoggedIn', true);
        Get.off(() => const CustomerBookingView());
      }
    } on FirebaseAuthException catch (e) {
      progressDialog.dismiss();
      if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: 'Email already in use');
        return;
      } else if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'Password is weak');
        return;
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: 'Invalid Password');
      } else if (e.code == 'invalid-email') {
        Fluttertoast.showToast(msg: 'Invalid Email');
      } else if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: 'User not found');
      }
    } catch (e) {
      progressDialog.dismiss();
      Fluttertoast.showToast(msg: 'Something went wrong');
    }
  }

  void resetPassword(String email) {
    try {
      auth.sendPasswordResetEmail(email: email);
      Fluttertoast.showToast(msg: 'Please check email and reset password');
      Get.back();
    } catch (e) {
      Fluttertoast.showToast(msg: 'Something went wrong');
    }
  }

  // void signOut() async {
  //   await auth.signOut().then((value) async {
  //     SharedPreferences sharedPreferences =
  //         await SharedPreferences.getInstance();
  //     sharedPreferences.clear();
  //     Get.offAll(() => LoginView());
  //   });
  // }
}
