import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/di/app_component.dart';
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
  addStoreProfile(BuildContext context) async {
    if(ownerNameController.value.text.isEmpty){
      errorToast(context: context, msg: "Please enter name");
    }else if(mobileNumberController.value.text.isEmpty){
      errorToast(context: context, msg: "Please enter mobile number");
    }else if(tradeLicenseController.value.text.isEmpty){
      errorToast(context: context, msg: "Please enter trade license");
    }else if(addressController.value.text.isEmpty){
      errorToast(context: context, msg: "Please enter address");
    }else if(companyNameController.value.text.isEmpty){
      errorToast(context: context, msg: "Please enter company name");
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
          "company_type":companyNameController.value.text
        };
        var response = await servicePassUseCase(formData);
        if (response?.data != null) {
          print("this is not here");
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
    homeController.selectedLocations.value = ['0'];
    homeController.selectedTimeSlot = null;
    homeController.selectedAppointmentTimeSlot.value = ['0'];
    update();
  }
}
