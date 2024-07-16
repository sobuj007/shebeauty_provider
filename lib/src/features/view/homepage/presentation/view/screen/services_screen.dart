import 'package:flutter/material.dart';
import 'package:shebeauty_provider/src/core/di/app_component.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/features/view/homepage/presentation/controller/homepage_controller.dart';
import 'package:shebeauty_provider/src/features/widgets/common_appbar/common_appbar.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../widgets/common_cached_network_image/common_cached_network_image.dart';
import '../../../../../widgets/custom_text/custom_text.dart';

class ServicesScreen extends StatelessWidget {
   ServicesScreen({super.key});
  var controller = locator<HomepageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonCustomAppBar(
        appbarTitle: "My Services",
        onTap: () {},
      ),
      body: SingleChildScrollView(
        child:  Column(
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
                             Expanded(
                                flex: 2,
                                child: CustomText(
                                  text: "Rohima Begom",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  letterSpacing: 0.25,
                                )),
                            Expanded(
                              child: Padding(
                                padding:  EdgeInsets.only(
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
          ],
        ),
      ),
    );
  }
}
