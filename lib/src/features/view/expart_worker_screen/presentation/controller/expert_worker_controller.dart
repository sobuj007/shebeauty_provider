import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart' as d;
import 'package:shebeauty_provider/src/core/source/dio_client.dart';
import '../../../../../core/di/app_component.dart';
import '../../../../widgets/custom_toast/custom_toast.dart';
import '../../domain/repository/experts_create_repository.dart';
import '../../domain/usecase/experts_create_pass_usecase.dart';

class ExpertWorkerController extends GetxController{
  var workerNameController = TextEditingController().obs;
  var mobileNumberController = TextEditingController().obs;
  var nidNumberController = TextEditingController().obs;
  var experienceController = TextEditingController().obs;
  var experienceYear = false.obs;
  var gender = ''.obs;
  var isLoading = false.obs;
  final ImagePicker picker = ImagePicker();
  List<File?> images = <File?>[].obs;
  final ImagePicker pickerSingle = ImagePicker();
  Rx<File> pickedImage = File("").obs;
  Rx<File> profileImage = File("").obs;
  Future<void> pickImage(int index, ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      images[index] = File(pickedFile.path);
    }
  }
// 'media_file': await d.MultipartFile.fromFile(
//             path,
//             filename: fileName,
//           ),
  submitExpertsInfo(BuildContext context) async {
    if(workerNameController.value.text.isEmpty){
      errorToast(context: context, msg: "Please enter your name.");
    }else if(mobileNumberController.value.text.isEmpty){
      errorToast(context: context, msg: "Please enter mobile number.");
    }else if(nidNumberController.value.text.isEmpty){
      errorToast(context: context, msg: "Please enter nid number.");
    }else if(experienceController.value.text.isEmpty){
      errorToast(context: context, msg: "Please enter experience year.");
    }else{
      try {
        isLoading.value = true;
        ExpartCreatePassUseCase expartCreatePassUseCase =
        ExpartCreatePassUseCase(locator<ExpartCreateRepository>());

        print("this is token ${session.getToken}");
        d.FormData formData = d.FormData.fromMap({
          "name": workerNameController.value.text,
          "expartyear": experienceController.value.text,
          "gender": gender.value.toString(),
          "mobile": mobileNumberController.value.text,
          "profile_image": await d.MultipartFile.fromFile(
            profileImage.value.path,
            filename: profileImage.value.path.split('/').last, // Get the file name
          ),
          "certificate_images": await d.MultipartFile.fromFile(
            pickedImage.value.path,
            filename: pickedImage.value.path.split('/').last, // Get the file name
          ),
        });
        var response = await expartCreatePassUseCase(formData);
        if (response?.data != null && response?.data?.message == "Expert added successfully."){
          print("this is not here");
          successToast(context: context, msg: "Successfully sign up");
        }else{
          print("this is value");
        }
      } catch (e) {
        print(e.toString());

      }finally{
        isLoading.value = false;
      }
    }
  }
  Future<void> pickImageForCertificate({required String from}) async {
    if (await Permission.storage.request().isGranted) {
      XFile? xFile = await pickerSingle.pickImage(source: ImageSource.gallery);
      if (xFile != null) {
        if(from == "certificate"){
          pickedImage.value = File(xFile.path);
          print(pickedImage);
        }else{
          profileImage.value = File(xFile.path);
          print(profileImage.value);
        }

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