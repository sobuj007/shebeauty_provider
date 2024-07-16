import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shebeauty_provider/src/core/di/app_component.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/features/view/homepage/presentation/controller/homepage_controller.dart';
import 'package:shebeauty_provider/src/features/widgets/common_appbar/common_appbar.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_elevatedButton/custom_eleveted_button.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../widgets/common_cached_network_image/common_cached_network_image.dart';
import '../../../../../widgets/custom_text/custom_text.dart';
import '../widget/custom_row_widget.dart';

class ServicesScreen extends StatelessWidget {
  ServicesScreen({super.key});
  var controller = locator<HomepageController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: Colors.white,
          appBar: CommonCustomAppBar(
            appbarTitle: "My Services",
            onTap: () {},
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                                borderRadius: BorderRadius.circular(10),
                                color: controller.selectedValue.value == false
                                    ? AppColors.buttonColor
                                    : Colors.transparent),
                            child: CustomText(
                              text: "Individual",
                              fontSize:
                                  controller.selectedValue.value == false
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
                                borderRadius: BorderRadius.circular(10),
                                color: controller.selectedValue.value == true
                                    ? AppColors.buttonColor
                                    : Colors.transparent),
                            child: CustomText(
                              text: "Corporate",
                              fontSize: controller.selectedValue.value == true
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            text: "Rohima Begom",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            letterSpacing: 0.25,
                          ),
                          1.ph,
                          const CustomText(
                            text: "RBegon@gmail.com",
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            letterSpacing: 0.25,
                          ),
                          5.ph,
                          const CustomText(
                            text: "+8801921334543",
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            letterSpacing: 0.25,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                10.ph,
                const CustomRowWidget(
                    firstTitle: "My Services",
                    secondTitle: "ADD",
                    icon: Icons.add_box_sharp),
                10.ph,
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (_, index) {
                      return SizedBox(
                        height: 169,
                        child: Card(
                          elevation: 3,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 99,
                                      width: 82,
                                      child: CommonCachedNetworkImage(
                                        imageUrl:
                                        "https://i.pinimg.com/550x/92/dc/1b/92dc1b3063e2cd03df8c48437b7a2e4e.jpg",
                                        borderRadius: 3.0,
                                      ),
                                    ),
                                    10.pw,
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        20.ph,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 40,
                                              width: 40,
                                              child: CommonCachedNetworkImage(
                                                imageUrl:
                                                "https://i.pinimg.com/550x/92/dc/1b/92dc1b3063e2cd03df8c48437b7a2e4e.jpg",
                                                borderRadius: 100.0,
                                              ),
                                            ),
                                            10.pw,
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const CustomText(text: "Headline 6", fontWeight: FontWeight.w500, fontSize: 16, letterSpacing: 0.15,),
                                                5.ph,
                                                CustomText(text: "Body 2", fontWeight: FontWeight.w400, fontSize: 12, letterSpacing: 0.15,textColor: AppColors.grey,),
                                              ],
                                            )
                                          ],
                                        ),
                                        10.ph,
                                        CustomText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.", fontSize: 12, fontWeight: FontWeight.w400,textColor: AppColors.grey,)
                                      ],
                                    ),)
                                  ],
                                ),

                                10.ph,

                                SizedBox(
                                    height: 36,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: CustomElevatedButton(
                                        borderRadiusValue: 2,
                                        color: AppColors.slideMeroon,
                                        onPress: () {
                                          // controller.updateValues();
                                        },
                                        // RouteGenerator.pushNamed(context, Routes.mortgageResultPage);
                                        text:  CustomText(
                                          text: "EDIT",
                                          textColor: AppColors.textColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.25,
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
