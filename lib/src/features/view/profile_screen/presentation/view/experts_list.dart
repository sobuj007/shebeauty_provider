import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/features/view/profile_screen/presentation/controller/profile_controller.dart';

import 'package:shebeauty_provider/src/core/utils/app_colors.dart';
import '../../../../widgets/common_cached_network_image/common_cached_network_image.dart';
import '../../../../widgets/custom_text/custom_text.dart';

class ExpertsList extends StatelessWidget {
  final ProfileController controller;
  const ExpertsList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (_, index) {
          return Card(
            elevation: 0,
            color: AppColors.buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(3),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 91,
                    width: 68,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(
                            10),
                        color: HexColor("958D8D")),
                    child: CommonCachedNetworkImage(
                        borderRadius: 5,
                        imageUrl:
                        "https://www.shutterstock.com/image-photo/smiling-mature-man-wearing-spectacles-260nw-1432699253.jpg"),
                  ),
                  10.pw,
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Name",
                          fontSize: 14,
                          fontWeight:
                          FontWeight.w500,
                          letterSpacing: 0.25,
                        ),
                        10.ph,
                        CustomText(
                          text: "017456212788",
                          fontSize: 12,
                          fontWeight:
                          FontWeight.w500,
                          letterSpacing: 0.25,
                        ),
                        10.ph,
                        CustomText(
                          text: "Expert's years",
                          fontSize: 12,
                          fontWeight:
                          FontWeight.w500,
                          letterSpacing: 0.25,
                        ),
                        Obx(()=> Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 13,
                                  width: 13,
                                  child: Radio(
                                      value: 1, groupValue: controller.gender.value, onChanged: (value){
                                    controller.gender.value = value!;
                                  }),
                                ),
                                Icon(Icons.boy, size: 23,)
                              ],
                            ),
                            10.pw,
                            Row(
                              children: [
                                SizedBox(
                                  height: 13,
                                  width: 13,
                                  child: Radio(value: 2, groupValue: controller.gender.value, onChanged: (value){
                                    controller.gender.value = value!;
                                  }),
                                ),
                                Icon(Icons.girl, size: 23,)
                              ],
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
