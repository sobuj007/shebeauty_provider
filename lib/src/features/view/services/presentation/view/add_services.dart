import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty_provider/src/core/di/app_component.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/features/view/services/presentation/controller/service_controller.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_elevatedButton/custom_eleveted_button.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_text/custom_text.dart';

import '../../../../../core/routes/AppRouts.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../widgets/common_appbar/common_appbar.dart';
import '../../../../widgets/common_textField_widget/common_textfield_widget.dart';

class AddServicesScreen extends StatelessWidget {
  AddServicesScreen({super.key});
  var controller = locator<ServiceController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: Colors.white,
          appBar: CommonCustomAppBar(
            appbarTitle: "Add Services",
            onTap: () {
              Get.toNamed(AppRoutes.servicesScreen);
            },
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.ph,
                  CommonTextfieldWidget(
                    hintText: "Honey Wax",
                    controller: controller.nameController.value,
                    labelText: "Name",
                    keyboardType: TextInputType.text,
                  ),
                  15.ph,
                  CommonTextfieldWidget(
                    hintText: "Wax",
                    controller: controller.categoryController.value,
                    labelText: "Category Name",
                    keyboardType: TextInputType.text,
                  ),
                  15.ph,
                  CommonTextfieldWidget(
                    hintText: "Honey Wax",
                    controller: controller.subCategoryController.value,
                    labelText: "Sub Category Name",
                    keyboardType: TextInputType.text,
                  ),
                  15.ph,
                  CommonTextfieldWidget(
                    hintText: "Body",
                    controller: controller.bodyPartController.value,
                    labelText: "Body Part",
                    keyboardType: TextInputType.text,
                  ),
                  15.ph,
                  Row(
                    children: [
                      Expanded(
                        child: CommonTextfieldWidget(
                          hintText: "Price",
                          controller: controller.servicesPriceController.value,
                          labelText: "Services Price",
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      15.pw,
                      Expanded(
                        child: CommonTextfieldWidget(
                          hintText: "Price",
                          controller:
                              controller.withProductPriceController.value,
                          labelText: "With Product Price",
                          keyboardType: TextInputType.text,
                        ),
                      )
                    ],
                  ),
                  15.ph,
                  TextFormField(
                    controller: controller.serviceDescriptionController.value,
                    maxLines: 7,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: "Roboto",
                    ),
                    decoration: InputDecoration(
                      label: const Text("Services Description"),
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
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
                  15.ph,
                  const CustomText(
                    text: "Add Category Image",
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.15,
                  ),
                  5.ph,
                  SizedBox(
                    height: 65,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.buttonColor.withOpacity(0.5),
                            border: Border.all(
                                color: AppColors.buttonColor, width: 1),
                          ),
                          width: (MediaQuery.of(context).size.width / 5) - 16,
                          height: 60,
                          child: const Center(
                            child: Icon(Icons.add_photo_alternate, size: 22),
                          ),
                        );
                      },
                    ),
                  ),
                  15.ph,
                  Row(
                    children: [
                      Expanded(
                        child: CommonTextfieldWidget(
                          hintText: "Male",
                          controller: controller.maleController.value,
                          labelText: "Male",
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      15.pw,
                      Expanded(
                        child: CommonTextfieldWidget(
                          hintText: "Female",
                          controller: controller.femaleController.value,
                          labelText: "Female",
                          keyboardType: TextInputType.text,
                        ),
                      )
                    ],
                  ),
                  15.ph,
                  const CustomText(
                    text: "Product Brand:",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.15,
                  ),
                  5.ph,
                  SizedBox(
                    height: 65,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.buttonColor.withOpacity(0.5),
                            border: Border.all(
                                color: AppColors.buttonColor, width: 1),
                          ),
                          width: 100,
                          height: 60,
                          child: const Center(
                            child: Icon(Icons.add_photo_alternate, size: 22),
                          ),
                        );
                      },
                    ),
                  ),
                  15.ph,
                  CustomElevatedButton(
                    onPress: (){
                      Get.offAllNamed(AppRoutes.parentScreen);
                    },
                    text: const CustomText(
                      text: "Submit",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black,
                    ),
                  ),
                  20.ph,
                ],
              ),
            ),
          ),
        ));
  }
}
