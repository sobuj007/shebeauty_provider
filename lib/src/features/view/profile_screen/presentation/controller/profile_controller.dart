import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../../core/di/app_component.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../widgets/custom_text/custom_text.dart';
import '../../../../widgets/custom_toast/custom_toast.dart';
import '../../../homepage/presentation/controller/homepage_controller.dart';
import '../../domain/repository/store_profile_repository.dart';
import '../../domain/usecase/store_profile_pass_usecase.dart';

class ProfileController extends GetxController{
  var ownerNameController = TextEditingController().obs;
  var mobileNumberController = TextEditingController().obs;
  var ownerNIDController = TextEditingController().obs;
  var tradeLicenseController = TextEditingController().obs;
  var addressController = TextEditingController().obs;
  var companyNameController = TextEditingController().obs;
  var selectedValue = false.obs;
  var tradeLicenseVisility = false.obs;
  var homeController = locator<HomepageController>();
  var isDataSubmited = false.obs;
  var gender = 0.obs;
  final ImagePicker picker = ImagePicker();
  Rx<File> profileImage = File("").obs;
  addStoreProfile(BuildContext context) async {

    if(ownerNameController.value.text.isEmpty){
      errorToast(context: context, msg: "Please enter name");
    }else if(mobileNumberController.value.text.isEmpty){
      errorToast(context: context, msg: "Please enter mobile number");
    }else if(tradeLicenseController.value.text.isEmpty){
      errorToast(context: context, msg: "Please enter trade license");
    }else if(addressController.value.text.isEmpty){
      errorToast(context: context, msg: "Please enter address");
    }else if(homeController.selectedCity?.id == 0){
      errorToast(context: context, msg: "Please select city");
    }else if(homeController.selectedLocations.isEmpty){
      errorToast(context: context, msg: "Please select location");
    }
    else{
      try{
        isDataSubmited.value = true;
        StoreProfilePassUseCase servicePassUseCase =
        StoreProfilePassUseCase(locator<StoreProfileRepository>());
        var formData =     {
          "storename":ownerNameController.value.text,
          "tradelicence":tradeLicenseController.value.text,
          "address":addressController.value.text,
          "mobile":mobileNumberController.value.text,
          "city_id": homeController.selectedCity?.id.toString() ?? '',
          "location_ids": homeController.selectedLocations,
          "company_type": selectedValue.value == false ? "Individual" : "Corporate"
        };
        var response = await servicePassUseCase(formData);
        if (response?.data != null) {
          print("this is here");
          successToast(context: context, msg: response?.data?.message ?? '');
          clearData();
        } else {
          print("this is value");
        }
      }catch(e){
        isDataSubmited.value = false;
      }finally{
        isDataSubmited.value = false;
      }
    }
  }

  clearData(){
    ownerNameController.value.clear();
    addressController.value.clear();
    mobileNumberController.value.clear();
    tradeLicenseController.value.clear();
    companyNameController.value.clear();
    homeController.selectedCategory = null;
    homeController.selectedSubCategory = null;
    homeController.selectedBodyPart = null;
    homeController.selectedCity = null;
    homeController.selectedLocations.value = [];
    homeController.selectedTimeSlot = null;
    homeController.selectedCity =  homeController.cityList.first;
    homeController.selectedAppointmentTimeSlot.value = [];
    update();
  }
  Future<void> pickImageFromGallery() async {
    if (await Permission.storage.request().isGranted) {
      final XFile? pickedFile =
      await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        profileImage.value = File(pickedFile.path);
      }
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      await Permission.storage.request();
    }
  }

  // Pick image from camera
  Future<void> pickImageFromCamera() async {
    if (await Permission.storage.request().isGranted) {
      final XFile? pickedFile =
      await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        profileImage.value = File(pickedFile.path);
      }
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      await Permission.storage.request();
    }
  }
  void showImageSourceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: CustomText(
            text: 'Choose Image Source',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            textColor: AppColors.appColor,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(
                  Icons.photo,
                  color: AppColors.appColor,
                ),
                title: CustomText(
                  text: 'Gallery',
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  textColor: AppColors.appColor,
                ),
                onTap: () {
                  pickImageFromGallery();
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.camera,
                  color: AppColors.appColor,
                ),
                title: CustomText(
                  text: 'Camera',
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  textColor: AppColors.appColor,
                ),
                onTap: () {
                  pickImageFromCamera();
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
