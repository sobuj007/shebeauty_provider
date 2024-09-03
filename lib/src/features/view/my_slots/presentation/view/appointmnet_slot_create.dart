import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/core/utils/app_sizes.dart';
import 'package:shebeauty_provider/src/features/view/my_slots/presentation/controller/my_slot_create_controller.dart';
import 'package:shebeauty_provider/src/features/widgets/common_appbar/common_appbar.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_text/custom_text.dart';

import '../../../../../core/di/app_component.dart';
import '../../../../../core/model/dropdown_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../widgets/custom_dropdown_button/custom_dropdown_button.dart';
import '../../../../widgets/custom_elevatedButton/custom_eleveted_button.dart';

class AppointmnetSlotCreate extends StatelessWidget {
  AppointmnetSlotCreate({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonCustomAppBar(
          appbarTitle: "Create Appointment slot", onTap: () {}),
      body:  GetBuilder(
        init: MySlotCreateController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  CustomDropDown(
                    fieldTitle: "",
                    titleFontSize: 16,
                    dropdownColor: Colors.white,
                    spinnerItemList: controller.myTimeSlots,
                    onChanged: (DropdownModel model) {
                      controller.myTimeSlotChange(model);
                    },
                    selectedItem: controller.selectedMyTimeSlots ??
                        controller.myTimeSlots.first,
                  ),
                  15.ph,
                  InkWell(
                    onTap: () => controller.selectDateTime(context),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 0.5)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: CustomText(text: controller.selectedDateTime.value.toString().isEmpty ? "Select Time" : "${controller.formatDateTime(controller.selectedDateTime.value)}"),
                      ),
                    ),
                  ),
                  15.ph,
                  TextFormField(
                    controller: controller.noteController.value,
                    maxLines: 3,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: "Roboto",
                    ),
                    decoration: InputDecoration(
                      label: CustomText(text: "Enter Note", fontSize: AppSizes.size13,),
                      contentPadding: const EdgeInsets.fromLTRB(
                          20.0, 10.0, 20.0, 10.0),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: AppColors.grey,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: AppColors.grey,
                          width: 1.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      labelStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey,
                          fontFamily: "Roboto"),
                    ),
                  ),

                  30.ph,
                  CustomElevatedButton(
                    color: HexColor("D9D9D9"),
                    onPress: () {
                      controller.createAppointmentSlot(context);
                    },
                    text: controller.isLoading.value == true ? const Center(
                      child: CircularProgressIndicator(),
                    ) : const CustomText(
                      text: "Create Appointment Slot",
                      textColor: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
