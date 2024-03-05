import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class AddSaaleAppliancesViewModel with ChangeNotifier {
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
}
