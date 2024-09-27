import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/features/view/homepage/presentation/controller/homepage_controller.dart';
import 'package:shebeauty_provider/src/features/view/profile_screen/presentation/controller/profile_controller.dart';

import 'package:shebeauty_provider/src/core/utils/app_colors.dart';
import '../../../../widgets/common_cached_network_image/common_cached_network_image.dart';
import '../../../../widgets/custom_text/custom_text.dart';

class ExpertsList extends StatelessWidget {
  const ExpertsList({super.key,});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomepageController(),
      builder: (controller) {
        return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.expertsListModel.value.data?.length,
            itemBuilder: (_, index) {
              var item = controller.expertsListModel.value.data?[index];
              return Card(
                elevation: 1,
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // Container(
                      //   height: 91,
                      //   width: 68,
                      //   decoration: BoxDecoration(
                      //       borderRadius:
                      //       BorderRadius.circular(
                      //           10),
                      //       color: HexColor("958D8D")),
                      //   child:
                        CommonCachedNetworkImage(
                            borderRadius: 5,
                            imageUrl: item?.profileImage ?? ''),
                      // ),
                      10.pw,
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: item?.name ?? '',
                              fontSize: 14,
                              fontWeight:
                              FontWeight.w500,
                              letterSpacing: 0.25,
                            ),
                            2.ph,
                            CustomText(
                              text: item?.mobile ?? '',
                              fontSize: 12,
                              fontWeight:
                              FontWeight.w500,
                              letterSpacing: 0.25,
                            ),
                            2.ph,
                            CustomText(
                              text: "Experience Year: ${item?.expartyear ?? ''} years",
                              fontSize: 12,
                              fontWeight:
                              FontWeight.w500,
                              letterSpacing: 0.25,
                            ),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        border: Border.all(color: item?.gender == "male" ||  item?.gender == "Male" ?  AppColors.appColor : AppColors.grey, width: 2)
                                      ),
                                      height: 20,
                                      width: 20,
                                      child: Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                            color: item?.gender == "male" ||  item?.gender == "Male" ?  AppColors.appColor : AppColors.grey,
                                          ),
                                          height: 13,
                                          width: 13,
                                        ),
                                      ),
                                    ),
                                    Icon(Icons.boy, size: 23,)
                                  ],
                                ),
                                10.pw,
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          border: Border.all(color: item?.gender == "female" ||  item?.gender == "Female"?  AppColors.appColor : AppColors.grey, width: 2)
                                      ),
                                      height: 20,
                                      width: 20,
                                      child: Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            color: item?.gender == "female" ||  item?.gender == "Female" ?  AppColors.appColor : AppColors.grey,
                                          ),
                                          height: 13,
                                          width: 13,
                                        ),
                                      ),
                                    ),
                                    Icon(Icons.girl, size: 23,)
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      }
    );
  }
}
