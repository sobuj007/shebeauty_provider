import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ExpertWorkerController extends GetxController{
  var workerNameController = TextEditingController().obs;
  var mobileNumberController = TextEditingController().obs;
  var nidNumberController = TextEditingController().obs;
  var experienceController = TextEditingController().obs;
  var experienceYear = false.obs;
  var gender = 0.obs;
  final ImagePicker picker = ImagePicker();
  List<File?> images = <File?>[].obs;
  final ImagePicker pickerSingle = ImagePicker();
  Rx<File> pickedImage = File("").obs;
  Future<void> pickImage(int index, ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      images[index] = File(pickedFile.path);
    }
  }

  Future<void> pickImageForCertificate() async {
    if (await Permission.storage.request().isGranted) {
      XFile? xFile = await pickerSingle.pickImage(source: ImageSource.gallery);
      if (xFile != null) {
        pickedImage.value = File(xFile.path);
        print(pickedImage);
        update();
      }
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      await Permission.storage.request();
    }

    update();
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