import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignupController extends GetxController{
  var emailController = TextEditingController().obs;
  var companyNameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var confirmPasswordController = TextEditingController().obs;
  var workerNameController = TextEditingController().obs;
  var mobileNumberController = TextEditingController().obs;
  var nidNumberController = TextEditingController().obs;
  var experienceController = TextEditingController().obs;
  var passwordVisibility = true.obs;
  var confirmPasswordVisibility = true.obs;
  var termConditions = false.obs;
  var experienceYear = false.obs;
  var gender = 0.obs;
  final ImagePicker picker = ImagePicker();
  List<File?> images = <File?>[].obs;
  Future<void> pickImage(int index, ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
        images[index] = File(pickedFile.path);
    }
  }

  void addContainer() {
    images.add(null);
  }
  void showPicker(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Photo Library'),
                onTap: () {
                  pickImage(index, ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () {
                  pickImage(index, ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}