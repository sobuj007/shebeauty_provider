import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shebeauty_provider/src/core/di/app_component.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/features/view/auth/signup_screen/presentation/controller/signup_controller.dart';
import 'package:shebeauty_provider/src/features/view/expart_worker_screen/presentation/controller/expert_worker_controller.dart';
import 'package:shebeauty_provider/src/features/view/homepage/presentation/controller/homepage_controller.dart';
import 'package:shebeauty_provider/src/features/view/profile_screen/presentation/controller/profile_controller.dart';
import 'package:shebeauty_provider/src/features/widgets/common_appbar/common_appbar.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_elevatedButton/custom_eleveted_button.dart';

import '../../../../../core/model/dropdown_model.dart';
import '../../../../../core/routes/AppRouts.dart';
import '../../../../../core/source/dio_client.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../widgets/common_cached_network_image/common_cached_network_image.dart';
import '../../../../widgets/common_textField_widget/common_textfield_widget.dart';
import '../../../../widgets/custom_dropdown_button/custom_dropdown_button.dart';
import '../../../../widgets/custom_text/custom_text.dart';
import 'experts_list.dart';

class ProfileSettingScreen extends StatelessWidget {
  ProfileSettingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProfileController(),
      builder: (controller) {
        return GetBuilder(
          init: ExpertWorkerController(),
          builder: (expertsController) {
            return GetBuilder(
              init: HomepageController(),
              builder: (homeController) {
                return Obx(() => Scaffold(
                  backgroundColor: Colors.white,
                      appBar: const CommonCustomAppBar(appbarTitle: "Profile"),
                      body: Stack(
                        children: [
                          // Column(
                          //   children: [
                          //     Container(
                          //       height: 127,
                          //       width: MediaQuery.of(context).size.width,
                          //       color: AppColors.containerColor,
                          //     ),
                          //   ],
                          // ),
                          Positioned(
                            top: 10,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.89,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    controller.selectedValue.value = false;
                                                  },
                                                  child: Container(
                                                      padding: const EdgeInsets.symmetric(
                                                          horizontal: 10, vertical: 1),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(10),
                                                          color: controller.selectedValue
                                                                      .value ==
                                                                  false
                                                              ? AppColors.buttonColor
                                                              : Colors.transparent),
                                                      child: CustomText(
                                                        text: "Individual",
                                                        fontSize: controller
                                                                    .selectedValue.value ==
                                                                false
                                                            ? 16
                                                            : 14,
                                                        fontWeight: FontWeight.w400,
                                                        letterSpacing: 0.25,
                                                      )),
                                                ),
                                                10.pw,
                                                InkWell(
                                                  onTap: () {
                                                    controller.selectedValue.value = true;
                                                  },
                                                  child: Container(
                                                      padding: const EdgeInsets.symmetric(
                                                          horizontal: 10, vertical: 1),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(10),
                                                          color: controller.selectedValue
                                                                      .value ==
                                                                  true
                                                              ? AppColors.buttonColor
                                                              : Colors.transparent),
                                                      child: CustomText(
                                                        text: "Corporate",
                                                        fontSize: controller
                                                                    .selectedValue.value ==
                                                                true
                                                            ? 16
                                                            : 14,
                                                        fontWeight: FontWeight.w400,
                                                        letterSpacing: 0.25,
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                          20.ph,
                                          Row(
                                            children: [
                                               SizedBox(
                                                height: 75,
                                                width: 74,
                                                child: CommonCachedNetworkImage(
                                                  imageUrl: session.getPhoto.toString(),
                                                ),
                                              ),
                                              15.pw,
                                              Expanded(
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                    children: [
                                                       Expanded(
                                                          flex: 2,
                                                          child: CustomText(
                                                            text: session.getFullName.toString(),
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 16,
                                                            letterSpacing: 0.25,
                                                          )),
                                                      // Expanded(
                                                      //   child: Padding(
                                                      //     padding: const EdgeInsets.only(
                                                      //         right: 15),
                                                      //     child: Container(
                                                      //       height: 21,
                                                      //       decoration: BoxDecoration(
                                                      //           borderRadius:
                                                      //               BorderRadius.circular(
                                                      //                   4),
                                                      //           color:
                                                      //               AppColors.buttonColor),
                                                      //       child: const Center(
                                                      //           child: CustomText(
                                                      //         text: "Gold",
                                                      //         fontSize: 12,
                                                      //         fontWeight: FontWeight.w500,
                                                      //         textAlign: TextAlign.center,
                                                      //         letterSpacing: 0.25,
                                                      //       )),
                                                      //     ),
                                                      //   ),
                                                      // )
                                                    ],
                                                  ),
                                                   CustomText(
                                                    text: session.getEmail.toString(),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    letterSpacing: 0.25,
                                                  ),
                                                  // const CustomText(
                                                  //   text: "+8801921334543",
                                                  //   fontWeight: FontWeight.w500,
                                                  //   fontSize: 12,
                                                  //   letterSpacing: 0.25,
                                                  // ),
                                                ],
                                              ))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CommonTextfieldWidget(
                                              hintText: "Enter store name",
                                              controller:
                                                  controller.storeNameController.value,
                                              labelText: "Store Name",
                                              keyboardType: TextInputType.text,
                                              obscureText: false,
                                              readOnly: (controller.storeProfileGet.value.profiles?.first.storename?.isEmpty ?? false) ? false : true,
                                            ),
                                            15.ph,
                                            CommonTextfieldWidget(
                                              hintText: "Enter mobile number",
                                              controller:
                                                  controller.mobileNumberController.value,
                                              labelText: "Mobile Number",
                                              keyboardType: TextInputType.phone,
                                              obscureText: false,
                                              readOnly: (controller.storeProfileGet.value.profiles?.first.mobile?.isEmpty ?? false) ? false : true,
                                            ),
                                            15.ph,
                                            // CommonTextfieldWidget(
                                            //   hintText: "Enter owner NID",
                                            //   controller:
                                            //       controller.ownerNIDController.value,
                                            //   labelText: "Owner NID",
                                            //   keyboardType: TextInputType.number,
                                            // ),
                                            // 15.ph,
                                            CommonTextfieldWidget(
                                              hintText: "Enter trade license",
                                              controller:
                                                  controller.tradeLicenseController.value,
                                              labelText: "Trade license",
                                              keyboardType: TextInputType.number,
                                              obscureText: false,
                                              readOnly: (controller.storeProfileGet.value.profiles?.first.tradelicence?.isEmpty ?? false) ? false : true,
                                            ),
                                            15.ph,
                                            CommonTextfieldWidget(
                                              hintText: "Enter address",
                                              controller:
                                                  controller.addressController.value,
                                              labelText: "Address",
                                              keyboardType: TextInputType.text,
                                              obscureText: false,
                                              readOnly: (controller.storeProfileGet.value.profiles?.first.address?.isEmpty ?? false) ? false : true,
                                            ),
                                            // 15.ph,
                                            // CommonTextfieldWidget(
                                            //   hintText: "Enter company name",
                                            //   controller:
                                            //       controller.companyNameController.value,
                                            //   labelText: "Company Name",
                                            //   keyboardType: TextInputType.text,
                                            //   obscureText: false,
                                            // ),
                                            // if(expertsController.images.isNotEmpty)
                                            // 10.ph,
                                            // if(expertsController.images.isNotEmpty)
                                            // const CustomText(
                                            //   text: "Certificate Image",
                                            //   fontSize: 13,
                                            //   fontWeight: FontWeight.w400,
                                            //   letterSpacing: 0.15,
                                            // ),
                                            // if(expertsController.images.isNotEmpty)
                                            // 5.ph,
                                            // if(expertsController.images.isNotEmpty)
                                            // SizedBox(
                                            //   height: 65,
                                            //   child: ListView.builder(
                                            //     scrollDirection: Axis.horizontal,
                                            //     itemCount: expertsController.images.length,
                                            //     itemBuilder: (_, index) {
                                            //       var item = expertsController.images[index];
                                            //       return Container(
                                            //         margin: const EdgeInsets.only(right: 10),
                                            //         decoration: BoxDecoration(
                                            //           borderRadius:
                                            //               BorderRadius.circular(4),
                                            //           color: AppColors.buttonColor
                                            //               .withOpacity(0.5),
                                            //           border: Border.all(
                                            //               color: AppColors.buttonColor,
                                            //               width: 1),
                                            //         ),
                                            //         width:
                                            //             (MediaQuery.of(context).size.width /
                                            //                     5) -
                                            //                 16,
                                            //         height: 60,
                                            //         child: item != null
                                            //             ? Image.file(item, fit: BoxFit.fill)
                                            //             : const Center(
                                            //                 child: Icon(
                                            //                     Icons.add_photo_alternate,
                                            //                     size: 22),
                                            //               ),
                                            //       );
                                            //     },
                                            //   ),
                                            // ),


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
                                                visible: homeController.selectedCity?.id == 0 &&  (controller.storeProfileGet.value.profiles?.first.locationIds?.isEmpty ?? false)
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
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: CustomElevatedButton(
                                                    color: Colors.black12,
                                                    borderRadiusValue: 5,
                                                    onPress: () {
                                                      if(controller.storeProfileGet.value.profiles?.isEmpty ?? false){
                                                      controller.addStoreProfile(context);
                                                      }else{

                                                      }
                                                    },
                                                    text:  CustomText(
                                                      text: (controller.storeProfileGet.value.profiles?.isEmpty ?? false) ? "Upload BIO" : "Edit BIO",
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 13,
                                                      letterSpacing: 0.25,
                                                      textColor: AppColors.appColor,
                                                    ),
                                                  ),
                                                ),
                                                10.pw,
                                                Expanded(
                                                  child: CustomElevatedButton(
                                                    color: AppColors.buttonColor,
                                                    borderRadiusValue: 15,
                                                    onPress: () {
                                                      Get.toNamed(
                                                        AppRoutes.signupScreenSetInformation);
                                                      // signupScreenSetInformation
                                                    },
                                                    text: controller.isDataSubmited.value == true ? const Center(
                                                      child: CircularProgressIndicator(),
                                                    ) : const CustomText(
                                                      text: "Add Experts Worker",
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 13,
                                                      letterSpacing: 0.25,
                                                      textColor: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            10.ph,
                                            const CustomText(
                                              text: "Experts:",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              letterSpacing: 0.25,
                                            ),
                                            10.ph,
                                            const ExpertsList(),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ));
              }
            );
          }
        );
      }
    );
  }
}
