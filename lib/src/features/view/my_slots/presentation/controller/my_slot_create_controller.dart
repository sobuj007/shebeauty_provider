import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty_provider/src/features/view/homepage/presentation/controller/homepage_controller.dart';
import 'package:shebeauty_provider/src/features/view/my_slots/data/model/my_slot_list_model.dart';
import 'package:intl/intl.dart';
import '../../../../../core/di/app_component.dart';
import '../../../../../core/model/dropdown_model.dart';
import '../../../../widgets/custom_toast/custom_toast.dart';
import '../../domain/repository/myslot_creation_repository.dart';
import '../../domain/usecase/myslot_creation_pass_usecase.dart';

class MySlotCreateController extends GetxController {
  var availableOpening = TextEditingController().obs;
  var title = TextEditingController().obs;
  var offDay = TextEditingController().obs;
  var slotDuration = TextEditingController().obs;
  var noteController = TextEditingController().obs;
  var isLoading = false.obs;
  var isLoadingMySlotList = false.obs;
  var mySlotListModel = MySlotListModel().obs;
  int childIndex = 0;
  var currentChildIndex = 0;
  var selectedTime = TimeOfDay.now().obs;
  List<DropdownModel> myTimeSlots = [];
  DropdownModel? selectedMyTimeSlots;
  List<DropdownModel> active = [
    DropdownModel(0, 'Select Active Option'),
    DropdownModel(1, 'Yes'),
    DropdownModel(2, 'No'),
  ];
  DropdownModel? selectedActive;
  void activeChange(DropdownModel model) {
    selectedActive = model;
    update();
  }

  @override
  void onInit() {
    mySlotListFunction();
    super.onInit();
  }

  // Function to show the time picker
  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
    );
    if (pickedTime != null && pickedTime != selectedTime.value) {
      selectedTime.value = pickedTime;
    }
    update();
  }
  var selectedDateTime = DateTime.now().obs;

  // Function to show the date picker
  Future<void> selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDateTime.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDateTime.value),
      );

      if (pickedTime != null) {

          selectedDateTime.value = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );

      }
    }
    update();
  }

  // Format the selected date and time
  String formatDateTime(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd HH:mm:ss.SSS').format(dateTime);
  }
  createMySlot(BuildContext context) async {
    if (title.value.text.isEmpty) {
      errorToast(context: context, msg: "Please enter title.");
    } else if (availableOpening.value.text.isEmpty) {
      errorToast(context: context, msg: "Please enter available time.");
    } else if (offDay.value.text.isEmpty) {
      errorToast(context: context, msg: "Please enter off day.");
    } else if (slotDuration.value.text.isEmpty) {
      errorToast(context: context, msg: "Please enter slot duration.");
    } else if (selectedActive?.id == 0) {
      errorToast(context: context, msg: "Please select terms and condition.");
    } else {
      try {
        isLoading.value = true;
        MySlotCreatePassUseCase mySlotCreatePassUseCase =
            MySlotCreatePassUseCase(locator<MySlotCreateRepository>());
        var formData = {
          "available_opening": availableOpening.value.text,
          "title": title.value.text,
          "offday": offDay.value.text,
          "active": selectedActive?.name == "Yes" ? true : false,
          "slot_duration": slotDuration.value.text
        };
        var response = await mySlotCreatePassUseCase(formData);
        if (response?.data != null) {
          print("this is not here");
          successToast(context: context, msg: response?.data?.message ?? '');
          mySlotListFunction();
          clearField();
        } else {
          print("this is value");
        }
      } catch (e) {
        print(e.toString());
        errorToast(context: context, msg: "The email has already been taken.");
      } finally {
        isLoading.value = false;
      }
    }
    update();
  }
  createAppointmentSlot(BuildContext context) async {
    if (selectedMyTimeSlots?.id == 0) {
      errorToast(context: context, msg: "Select slot.");
    } else if (selectedTime.value.toString().isEmpty) {
      errorToast(context: context, msg: "Please select time.");
    } else if (noteController.value.text.isEmpty) {
      errorToast(context: context, msg: "Please note.");
    } else {
      try {
        isLoading.value = true;
        AppointmentCreatePassUseCase appointmentCreatePassUseCase =
        AppointmentCreatePassUseCase(locator<MySlotCreateRepository>());
        var formData = {
          "slot_id": selectedMyTimeSlots?.id.toString() ?? '',
          "time": formatDateTime(selectedDateTime.value),
          "note": noteController.value.text,
        };
        var response = await appointmentCreatePassUseCase(formData);
        if (response?.data != null) {
          print("this is not here");
          successToast(context: context, msg: response?.data?.message ?? '');
          mySlotListFunction();
        } else {
          print("this is value");
        }
      } catch (e) {
        print(e.toString());
        errorToast(context: context, msg: "The email has already been taken.");
      } finally {
        isLoading.value = false;
      }
    }
    update();
  }
  mySlotListFunction() async {
    print("this is calling");
    try {
      isLoadingMySlotList.value = true;
      MySlotListPassUseCase mySlotListPassUseCase =
      MySlotListPassUseCase(locator<MySlotCreateRepository>());
      myTimeSlots.clear();
      myTimeSlots.add(DropdownModel(0, "Select slot"));

      var response = await mySlotListPassUseCase();
      if (response?.data != null) {
        mySlotListModel.value = response?.data ?? MySlotListModel();

        for (var item in mySlotListModel.value.data ?? []) {
          myTimeSlots.add(
            DropdownModel(item.id, item.title ?? ''),
          );
        }
        selectedMyTimeSlots = myTimeSlots.first;
        print(
            "This is my slot list model ${mySlotListModel.value.data?.first.title}");
      } else {
        print("this is value");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingMySlotList.value = false;
    }
    update();
  }

  Future<bool> updateChild(int currentIndex, int previousIndex) async {
    _updateTabIndex(currentIndex);
    await _updateChildSelection(currentIndex, previousIndex);
    mySlotListModel.value = mySlotListModel.value;
    return true;
  }

  Future<void> _updateChildSelection(
      int currentIndex, int previousIndex) async {
    mySlotListModel.value.data![currentIndex].selected = true;
    mySlotListModel.value.data![previousIndex].selected = false;
  }

  void _updateTabIndex(int childIndex) {
    childIndex = childIndex;
  }
  void myTimeSlotChange(DropdownModel model) {
    selectedMyTimeSlots = model;
    update();
  }
  clearField() {
    title.value.clear();
    availableOpening.value.clear();
    offDay.value.clear();
    slotDuration.value.clear();
    selectedActive = null;
    title.value.clear();
    update();
  }
}


