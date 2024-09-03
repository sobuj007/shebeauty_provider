import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shebeauty_provider/src/core/di/app_component.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/features/view/auth/signup_screen/presentation/controller/signup_controller.dart';
import 'package:shebeauty_provider/src/features/view/expart_worker_screen/presentation/controller/expert_worker_controller.dart';
import 'package:shebeauty_provider/src/features/view/profile_screen/presentation/controller/profile_controller.dart';
import 'package:shebeauty_provider/src/features/widgets/common_appbar/common_appbar.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_elevatedButton/custom_eleveted_button.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../widgets/common_cached_network_image/common_cached_network_image.dart';
import '../../../../widgets/common_textField_widget/common_textfield_widget.dart';
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
            return Obx(() => Scaffold(
                  appBar: const CommonCustomAppBar(appbarTitle: "Profile"),
                  body: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 127,
                            width: MediaQuery.of(context).size.width,
                            color: AppColors.containerColor,
                          ),
                        ],
                      ),
                      Positioned(
                        top: 10,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.87,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
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
                                      50.ph,
                                      Row(
                                        children: [
                                          const SizedBox(
                                            height: 75,
                                            width: 74,
                                            child: CommonCachedNetworkImage(
                                              imageUrl:
                                                  "https://www.shutterstock.com/image-photo/smiling-mature-man-wearing-spectacles-260nw-1432699253.jpg",
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
                                                  const Expanded(
                                                      flex: 2,
                                                      child: CustomText(
                                                        text: "Rohima Begom",
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 16,
                                                        letterSpacing: 0.25,
                                                      )),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(
                                                          right: 15),
                                                      child: Container(
                                                        height: 21,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    4),
                                                            color:
                                                                AppColors.buttonColor),
                                                        child: const Center(
                                                            child: CustomText(
                                                          text: "Gold",
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w500,
                                                          textAlign: TextAlign.center,
                                                          letterSpacing: 0.25,
                                                        )),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const CustomText(
                                                text: "RBegon@gmail.com",
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                letterSpacing: 0.25,
                                              ),
                                              const CustomText(
                                                text: "+8801921334543",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                letterSpacing: 0.25,
                                              ),
                                            ],
                                          ))
                                        ],
                                      ),
                                      20.ph,
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
                                          hintText: "Enter owner name",
                                          controller:
                                              controller.ownerNameController.value,
                                          labelText: "Owner Name",
                                          keyboardType: TextInputType.text,
                                        ),
                                        15.ph,
                                        CommonTextfieldWidget(
                                          hintText: "Enter mobile number",
                                          controller:
                                              controller.mobileNumberController.value,
                                          labelText: "Mobile Number",
                                          keyboardType: TextInputType.phone,
                                        ),
                                        15.ph,
                                        CommonTextfieldWidget(
                                          hintText: "Enter owner NID",
                                          controller:
                                              controller.ownerNIDController.value,
                                          labelText: "Owner NID",
                                          keyboardType: TextInputType.number,
                                        ),
                                        15.ph,
                                        CommonTextfieldWidget(
                                          hintText: "Enter trade license",
                                          controller:
                                              controller.tradeLicenseController.value,
                                          labelText: "Trade license",
                                          obscureText:
                                              controller.tradeLicenseVisility.value,
                                          keyboardType: TextInputType.number,
                                          icon: InkWell(
                                              onTap: () {
                                                controller.tradeLicenseVisility.value =
                                                    !controller
                                                        .tradeLicenseVisility.value;
                                              },
                                              child:
                                                  controller.tradeLicenseVisility.value
                                                      ? const Icon(Icons.visibility_off)
                                                      : const Icon(Icons.visibility)),
                                        ),
                                        15.ph,
                                        CommonTextfieldWidget(
                                          hintText: "Enter address",
                                          controller:
                                              controller.addressController.value,
                                          labelText: "Address",
                                          keyboardType: TextInputType.text,
                                        ),
                                        15.ph,
                                        CommonTextfieldWidget(
                                          hintText: "Enter store name",
                                          controller:
                                              controller.storeNameController.value,
                                          labelText: "Store Name",
                                          keyboardType: TextInputType.text,
                                        ),
                                        if(expertsController.images.isNotEmpty)
                                        10.ph,
                                        if(expertsController.images.isNotEmpty)
                                        const CustomText(
                                          text: "Certificate Image",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.15,
                                        ),
                                        if(expertsController.images.isNotEmpty)
                                        5.ph,
                                        if(expertsController.images.isNotEmpty)
                                        SizedBox(
                                          height: 65,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: expertsController.images.length,
                                            itemBuilder: (_, index) {
                                              var item = expertsController.images[index];
                                              return Container(
                                                margin: const EdgeInsets.only(right: 10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  color: AppColors.buttonColor
                                                      .withOpacity(0.5),
                                                  border: Border.all(
                                                      color: AppColors.buttonColor,
                                                      width: 1),
                                                ),
                                                width:
                                                    (MediaQuery.of(context).size.width /
                                                            5) -
                                                        16,
                                                height: 60,
                                                child: item != null
                                                    ? Image.file(item, fit: BoxFit.fill)
                                                    : const Center(
                                                        child: Icon(
                                                            Icons.add_photo_alternate,
                                                            size: 22),
                                                      ),
                                              );
                                            },
                                          ),
                                        ),
                                        15.ph,
                                        Row(
                                          children: [
                                            Expanded(
                                              child: CustomElevatedButton(
                                                color: AppColors.buttonColor,
                                                borderRadiusValue: 15,
                                                onPress: () {},
                                                text: const CustomText(
                                                  text: "Edit Bio",
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13,
                                                  letterSpacing: 0.25,
                                                  textColor: Colors.black,
                                                ),
                                              ),
                                            ),
                                            10.pw,
                                            Expanded(
                                              child: CustomElevatedButton(
                                                color: AppColors.buttonColor,
                                                borderRadiusValue: 15,
                                                onPress: () {},
                                                text: const CustomText(
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
                                        ExpertsList(),
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
}
