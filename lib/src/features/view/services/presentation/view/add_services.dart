import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty_provider/src/core/di/app_component.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/core/model/dropdown_model.dart';
import 'package:shebeauty_provider/src/core/utils/app_sizes.dart';
import 'package:shebeauty_provider/src/features/view/homepage/presentation/controller/homepage_controller.dart';
import 'package:shebeauty_provider/src/features/view/services/presentation/controller/service_controller.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_dropdown_button/custom_dropdown_button.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_elevatedButton/custom_eleveted_button.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_text/custom_text.dart';

import '../../../../../core/routes/AppRouts.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../widgets/common_appbar/common_appbar.dart';
import '../../../../widgets/common_textField_widget/common_textfield_widget.dart';

class AddServicesScreen extends StatelessWidget {
  AddServicesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ServiceController(),
        builder: (controller) {
          return GetBuilder(
              init: HomepageController(),
              builder: (homeController) {
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
                                hintText: "Enter Name",
                                controller: controller.nameController.value,
                                labelText: "Name",
                                keyboardType: TextInputType.text,
                                obscureText: false,
                              ),
                              15.ph,
                              CustomDropDown(
                                fieldTitle: "",
                                titleFontSize: 16,
                                dropdownColor: Colors.white,
                                spinnerItemList: homeController.category,
                                onChanged: (DropdownModel model) {
                                  homeController.categoryChange(model);
                                },
                                selectedItem: homeController.selectedCategory ??
                                    homeController.category.first,
                              ),
                              15.ph,
                              CustomDropDown(
                                fieldTitle: "",
                                titleFontSize: 16,
                                dropdownColor: Colors.white,
                                spinnerItemList: homeController.subCategory,
                                onChanged: (DropdownModel model) {
                                  homeController.subCategoryChange(model);
                                },
                                selectedItem:
                                    homeController.selectedSubCategory ??
                                        homeController.subCategory.first,
                              ),
                              15.ph,
                              CustomDropDown(
                                fieldTitle: "",
                                titleFontSize: 16,
                                dropdownColor: Colors.white,
                                spinnerItemList: homeController.bodyPart,
                                onChanged: (DropdownModel model) {
                                  homeController.bodypartChange(model);
                                },
                                selectedItem: homeController.selectedBodyPart ??
                                    homeController.bodyPart.first,
                              ),
                              15.ph,
                              CustomDropDown(
                                fieldTitle: "",
                                titleFontSize: 16,
                                dropdownColor: Colors.white,
                                spinnerItemList: homeController.cityList,
                                onChanged: (DropdownModel model) {
                                  homeController.locationList.clear();
                                  homeController.cityChange(model);
                                },
                                selectedItem: homeController.selectedCity ??
                                    homeController.cityList.first,
                              ),
                              Visibility(
                                  visible: homeController.selectedCity == null
                                      ? false
                                      : true,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount:
                                          homeController.locationList.length,
                                      itemBuilder: (_, index) {
                                        var item =
                                            homeController.locationList[index];
                                        return Row(
                                          children: [
                                            Obx(
                                                  () => Checkbox(
                                                value: homeController.selectedLocations.contains(item.id.toString()),
                                                onChanged: (bool? isChecked) {
                                                  if (isChecked == true) {
                                                    homeController.addLocation(item);
                                                  } else {
                                                    homeController.removeLocation(item);
                                                  }
                                                },
                                              ),
                                            ),

                                            CustomText(text: item.name),
                                          ],
                                        );
                                      })),
                              15.ph,
                              homeController.isLoadingTimeSlot.value == true
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : CustomDropDown(
                                      fieldTitle: "",
                                      titleFontSize: 16,
                                      dropdownColor: Colors.white,
                                      spinnerItemList:
                                          homeController.timeSlotList,
                                      onChanged: (DropdownModel model) {
                                        homeController.timeSlotChange(model);
                                      },
                                      selectedItem:
                                          homeController.selectedTimeSlot ??
                                              homeController.timeSlotList.first,
                                    ),
                              5.ph,
                             homeController.isLoadingAppointmentSlot.value == true ? const Center(
                               child: CircularProgressIndicator(),
                             ) :  Visibility(
                                  visible: homeController.selectedTimeSlot?.id == 0
                                      ? false
                                      : true,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount:
                                      homeController.appointmentSlotModel.value.data?.length,
                                      itemBuilder: (_, index) {
                                        var item =
                                        homeController.appointmentSlotModel.value.data?[index];
                                        return Row(
                                          children: [
                                            Obx(() => Checkbox(
                                              value: homeController
                                                  .selectedAppointmentTimeSlot
                                                  .contains(item?.id.toString()),
                                              onChanged: (bool? isChecked) {
                                                if (isChecked == true) {
                                                  homeController
                                                      .addAppointmentSlot(item);
                                                } else {
                                                  homeController
                                                      .removeAppointment(item);
                                                }
                                              },
                                            )),
                                            CustomText(text: item?.time ?? ''),
                                          ],
                                        );
                                      })),
                              15.ph,
                              Row(
                                children: [
                                  Expanded(
                                    child: CommonTextfieldWidget(
                                      hintText: "Price",
                                      controller: controller
                                          .servicesPriceController.value,
                                      labelText: "Services Price",
                                      keyboardType: TextInputType.text,
                                      obscureText: false,
                                    ),
                                  ),
                                  15.pw,
                                  Expanded(
                                    child: CommonTextfieldWidget(
                                      hintText: "Price",
                                      controller: controller
                                          .withProductPriceController.value,
                                      labelText: "With Product Price",
                                      keyboardType: TextInputType.text,
                                      obscureText: false,
                                    ),
                                  )
                                ],
                              ),
                              15.ph,
                              TextFormField(
                                controller: controller
                                    .serviceDescriptionController.value,
                                maxLines: 7,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: "Roboto",
                                ),
                                decoration: InputDecoration(
                                  label: const Text("Services Description"),
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
                              15.ph,
                              // const CustomText(
                              //   text: "Add Category Image",
                              //   fontSize: 13,
                              //   fontWeight: FontWeight.w400,
                              //   letterSpacing: 0.15,
                              // ),
                              // 5.ph,
                              // InkWell(
                              //   onTap: () =>
                              //       homeController.pickImageForCertificate(),
                              //   child: SizedBox(
                              //     height: 75,
                              //     width: 90,
                              //     child: (homeController.pickedImage.value.path.isNotEmpty)
                              //         ? ClipRRect(
                              //       borderRadius: BorderRadius.circular(5),
                              //       child: Image.file(
                              //         File(homeController.pickedImage.value.path),
                              //         height: 75,
                              //         width: 74,
                              //         fit: BoxFit.fill,
                              //       ),
                              //     )
                              //         : const Center(
                              //       child: Icon(
                              //         Icons.add_photo_alternate,
                              //         size: 22,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // 15.ph,
                              Obx(()=> Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(text: "Gender", fontWeight: FontWeight.w500, fontSize: AppSizes.size14,),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 13,
                                            width: 13,
                                            child: Radio(
                                                value: "male", groupValue: controller.genderForAddServices.value, onChanged: (value){
                                                  print("The gender value $value");
                                              controller.genderForAddServices.value = value!;
                                            }),
                                          ),
                                          const Icon(Icons.boy, size: 23,),
                                        ],
                                      ),
                                      30.pw,
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 13,
                                            width: 13,
                                            child: Radio(value: "Female", groupValue: controller.genderForAddServices.value, onChanged: (value){
                                              controller.genderForAddServices.value = value!;
                                            }),
                                          ),
                                          const Icon(Icons.girl, size: 23,)
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              )),
                              // 15.ph,
                              // const CustomText(
                              //   text: "Product Brand:",
                              //   fontSize: 16,
                              //   fontWeight: FontWeight.w500,
                              //   letterSpacing: 0.15,
                              // ),
                              // 5.ph,
                              // SizedBox(
                              //   height: 65,
                              //   child: ListView.builder(
                              //     scrollDirection: Axis.horizontal,
                              //     itemCount: 5,
                              //     itemBuilder: (_, index) {
                              //       return Container(
                              //         margin: const EdgeInsets.only(right: 10),
                              //         decoration: BoxDecoration(
                              //           borderRadius: BorderRadius.circular(4),
                              //           color: AppColors.buttonColor
                              //               .withOpacity(0.5),
                              //           border: Border.all(
                              //               color: AppColors.buttonColor,
                              //               width: 1),
                              //         ),
                              //         width: 100,
                              //         height: 60,
                              //         child: const Center(
                              //           child: Icon(Icons.add_photo_alternate,
                              //               size: 22),
                              //         ),
                              //       );
                              //     },
                              //   ),
                              // ),
                              15.ph,
                              CustomElevatedButton(
                                color: AppColors.deepPurple,
                                onPress: () {
                                  // Get.offAllNamed(AppRoutes.parentScreen);
                                  controller.addService(context);
                                },
                                text: controller.isDataSubmited.value == true ? const Center(
                                  child: CircularProgressIndicator(),
                                ) : const CustomText(
                                  text: "Submit",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  textColor: Colors.white,
                                ),
                              ),
                              8.ph,
                            ],
                          ),
                        ),
                      ),
                    ));
              });
        });
  }
}
