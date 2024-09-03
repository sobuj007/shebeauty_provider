import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/features/view/homepage/presentation/controller/homepage_controller.dart';
import 'package:shebeauty_provider/src/features/view/my_slots/presentation/controller/my_slot_create_controller.dart';

import '../../../../../core/model/dropdown_model.dart';
import '../../../../widgets/common_appbar/common_appbar.dart';
import '../../../../widgets/common_textField_widget/common_textfield_widget.dart';
import '../../../../widgets/custom_dropdown_button/custom_dropdown_button.dart';
import '../../../../widgets/custom_elevatedButton/custom_eleveted_button.dart';
import '../../../../widgets/custom_text/custom_text.dart';

class MySlotCreateScreen extends StatelessWidget {
  const MySlotCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonCustomAppBar(appbarTitle: "Create Slot", onTap: (){},),
      body: GetBuilder(
        init: MySlotCreateController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  10.ph,
                  CommonTextfieldWidget(
                    hintText: "title",
                    controller: controller.title.value,
                    labelText: "Enter title",
                    keyboardType: TextInputType.text,
                    obscureText: false,
                  ),
                  15.ph,
                  CommonTextfieldWidget(
                    hintText: "Available Opening",
                    controller: controller.availableOpening.value,
                    labelText: "Enter Available Opening(3:00 PM to 7:00 PM)",
                    keyboardType: TextInputType.text,
                    obscureText: false,
                  ),
                  15.ph,
                  CommonTextfieldWidget(
                    hintText: "Offday",
                    controller: controller.offDay.value,
                    labelText: "Enter your Offday",
                    keyboardType: TextInputType.text,
                    obscureText: false,
                  ),
                  15.ph,
                  CommonTextfieldWidget(
                    hintText: "Slot Duration",
                    controller: controller.slotDuration.value,
                    labelText: "Enter slot duration",
                    keyboardType: TextInputType.text,
                    obscureText: false,
                  ),
                  15.ph,
                  CustomDropDown(
                    fieldTitle: "",
                    titleFontSize: 16,
                    dropdownColor: Colors.white,
                    spinnerItemList: controller.active,
                    onChanged: (DropdownModel model) {
                      controller.activeChange(model);
                    },
                    selectedItem: controller.selectedActive ??
                        controller.active.first,
                  ),
                  20.ph,
                  CustomElevatedButton(
                    color: HexColor("D9D9D9"),
                    onPress: () {
                      controller.createMySlot(context);
                    },
                    text: controller.isLoading.value == true ? const Center(
                      child: CircularProgressIndicator(),
                    ) : const CustomText(
                      text: "Create",
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
