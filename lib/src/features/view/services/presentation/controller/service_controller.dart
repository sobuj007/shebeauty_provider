import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../core/di/app_component.dart';
import '../../../../../core/model/dropdown_model.dart';
import '../../../homepage/data/model/appointment_slot_model.dart';
import '../../../homepage/data/model/time_slot_model.dart';
import '../../../homepage/domain/repository/get_all_product_repository.dart';
import '../../../homepage/domain/usecase/experts_create_pass_usecase.dart';

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
  var isLoadingTimeSlot = false.obs;
  var serviceDescriptionController = TextEditingController(
          text:
              'Lorem ipsum dolor sit amet consectetur. Turpis augue quis eget maecenas in euismod sit. Eget mauris scelerisque risus donec commodo fermentum. Pretium egestas pretium senectus bibendum blandit sed. Diam posuere augue molestie velit aliquam pharetra aliquet.')
      .obs;

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
    print("this is products");
    // try {
    //   isLoadingAppointmentSlot.value = true;
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
    // } catch (e) {
    //   print(e.toString());
    // } finally {
    //   isLoadingAppointmentSlot.value = false;
    // }
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
