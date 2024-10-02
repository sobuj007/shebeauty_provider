import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shebeauty_provider/src/features/view/homepage/presentation/controller/homepage_controller.dart';

import '../../../../../core/di/app_component.dart';
import '../../../../../core/model/dropdown_model.dart';
import '../../../../widgets/custom_toast/custom_toast.dart';
import '../../../homepage/data/model/appointment_slot_model.dart';
import '../../../homepage/data/model/time_slot_model.dart';
import '../../../homepage/domain/repository/get_all_product_repository.dart';
import '../../../homepage/domain/usecase/get_all_product_pass_usecase.dart';
import '../../domain/repository/service_repository.dart';
import '../../domain/usecase/service_pass_usecase.dart';

class ServiceController extends GetxController {
  List<File?> images = <File?>[].obs;
  var nameController = TextEditingController().obs;
  var categoryController = TextEditingController().obs;
  var subCategoryController = TextEditingController().obs;
  var bodyPartController = TextEditingController().obs;
  var servicesPriceController = TextEditingController().obs;
  var withProductPriceController = TextEditingController().obs;
  var maleController = TextEditingController().obs;
  var femaleController = TextEditingController().obs;
  List<DropdownModel> timeSlotList = [];
  DropdownModel? selectedTimeSlot;
  var selectedLocations = [].obs;
  var selectedAppointmentTimeSlot = [].obs;
  var timeSlotModel = TimeSlotModel().obs;
  var appointmentSlotModel = AppointmentSlotModel().obs;
  var genderForAddServices = "".obs;
  var isLoadingTimeSlot = false.obs;
  var homeController = locator<HomepageController>();
  var serviceDescriptionController = TextEditingController().obs;
  var isDataSubmited = false.obs;
  @override
  void onInit() async{
   await timeSlotFunction();
    super.onInit();
  }
  Future<void> timeSlotFunction() async {
    try {
      isLoadingTimeSlot.value = true;
      TimeSlotPassUseCase timeSlotPassUseCase =
      TimeSlotPassUseCase(locator<GetAllProductRepository>());
      timeSlotList.clear();
      timeSlotList.add(DropdownModel(0, "Select time slot"));
      var response = await timeSlotPassUseCase();
      print(response?.data);
      if (response?.data != null) {
        timeSlotModel.value = response?.data ?? TimeSlotModel();
        for (var item in timeSlotModel.value.data ?? []) {
          print("this is hot data ${item.title}");
          timeSlotList.add(
            DropdownModel(item.id, item.title ?? ''),
          );
        }
        selectedTimeSlot = timeSlotList.first;
      } else {
        print("this is value");
      }
      update();
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingTimeSlot.value = false;
    }
    update();
  }
  void timeSlotChange(DropdownModel model) {
    selectedTimeSlot = model;
    if(selectedTimeSlot?.id != 0){
      appointmentSlotFunction(id: selectedTimeSlot?.id.toString() ?? '');
    }
    update();
  }
  Future<void> appointmentSlotFunction({required String id}) async {
    print("this is products77777");
    try {
      isLoadingTimeSlot.value = true;
    AppointmentSlotPassUseCase appointmentSlotPassUseCase =
    AppointmentSlotPassUseCase(locator<GetAllProductRepository>());
    var response = await appointmentSlotPassUseCase(id: id);
    print(response?.data);
    if (response?.data != null) {
      appointmentSlotModel.value = response?.data ?? AppointmentSlotModel();
      print("experts List model ${appointmentSlotModel.value.data?.first.time}");
    } else {
      appointmentSlotModel.value.data?.clear();
      print("this is value");
    }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingTimeSlot.value = false;
    }
  }

  addService(BuildContext context) async {
    print("is clicked");
    if(nameController.value.text.isEmpty){
      errorToast(context: context, msg: "Please enter name");
    }else if(homeController.selectedCategory?.id == 0){
      errorToast(context: context, msg: "Please enter category");
    }else if(homeController.selectedSubCategory?.id == 0){
      errorToast(context: context, msg: "Please select sub category");
    }else if(homeController.selectedBodyPart?.id == 0){
      errorToast(context: context, msg: "Please select body part");
    }else if(homeController.selectedCity?.id == 0){
      errorToast(context: context, msg: "Please select city");
    }else if(homeController.selectedLocations.isEmpty){
      errorToast(context: context, msg: "Please select location");
    }else if(homeController.selectedTimeSlot?.id == 0){
      errorToast(context: context, msg: "Please select time slot");
    }else if(homeController.selectedAppointmentTimeSlot.isEmpty){
      errorToast(context: context, msg: "Please select appointment timeslot");
    } else if(servicesPriceController.value.text.isEmpty){
      errorToast(context: context, msg: "Please enter service price");
    }else if(withProductPriceController.value.text.isEmpty){
      errorToast(context: context, msg: "Please enter product price");
    }else if( genderForAddServices.value.isEmpty){
      errorToast(context: context, msg: "Please select gender");
    }
    else{
     try{
       print("is clicked11");
       isDataSubmited.value = true;
       ServicePassUseCase servicePassUseCase =
       ServicePassUseCase(locator<ServiceRepository>());
       var formData =     {
         "name": nameController.value.text,
         "description": serviceDescriptionController.value.text,
         "product_price": withProductPriceController.value.text,
         "service_price": servicesPriceController.value.text,
         "gender": genderForAddServices.value,
         "category_id": homeController.selectedCategory?.id.toString() ?? '',
         "subcategory_id": homeController.selectedSubCategory?.id.toString() ?? '',
         "bodypart_id": homeController.selectedBodyPart?.id.toString() ?? '',
         "city_id": homeController.selectedCity?.id.toString() ?? '',
         "location_ids": homeController.selectedLocations ,
         "available_slot_id": homeController.selectedTimeSlot?.id ?? '',
         "appointment_slot_ids": homeController.selectedAppointmentTimeSlot
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
       print(e);
       isDataSubmited.value = false;
     }finally{
       isDataSubmited.value = false;
     }
    }
  }

clearData(){
    nameController.value.clear();
    serviceDescriptionController.value.clear();
    servicesPriceController.value.clear();
    withProductPriceController.value.clear();
    genderForAddServices.value = '';
    homeController.selectedTimeSlot = null;
    homeController.selectedCategory = null;
    homeController.selectedSubCategory = null;
    homeController.selectedBodyPart = null;
    homeController.selectedCity = null;
    homeController.selectedLocations.value = ['0'];
    homeController.selectedTimeSlot = null;
    homeController.selectedAppointmentTimeSlot.value = ['0'];
    update();
}

  void addLocation(item) {
    print("this is id ${item.id}");
    if (!selectedLocations.contains(item)) {
      selectedLocations.add(item.id);
    }
  }

  void removeLocation(item) {
    print("this is remove id ${item.id}");
    selectedLocations.remove(item.id);
  }

  void addAppointmentSlot(item) {
    print("this is id ${item.id}");
    if (!selectedAppointmentTimeSlot.contains(item)) {
      selectedAppointmentTimeSlot.add(item.id);
    }
  }

  void removeAppointment(item) {
    print("this is remove id ${item.id}");
    selectedAppointmentTimeSlot.remove(item.id);
  }


}
