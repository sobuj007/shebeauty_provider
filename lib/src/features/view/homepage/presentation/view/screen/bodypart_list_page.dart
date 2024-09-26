import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/core/utils/app_sizes.dart';

import '../../../../../../core/di/app_component.dart';
import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../widgets/common_appbar/common_appbar.dart';
import '../../../../../widgets/common_textField_widget/common_textfield_widget.dart';
import '../../../../../widgets/custom_text/custom_text.dart';
import '../../../data/model/get_all_product_model.dart';
import '../../controller/homepage_controller.dart';
class BodypartListPage extends StatelessWidget {
   BodypartListPage({super.key});
  var controller = locator<HomepageController>();
  @override
  Widget build(BuildContext context) {
    final subCategory = Get.arguments['bodypart'] as Subcategory?;
    var size1 = MediaQuery.of(context).size;
    final double itemHeight = (size1.height - kToolbarHeight - 10) / 6;
    final double itemWidth = size1.width / 4.1;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonCustomAppBar(
        appbarTitle: "Sub Category",
        onTap: () {
          // Get.toNamed(AppRoutes.addServicesScreen);

        },
        // icon: const Icon(Icons.add_box),
        // leadingText: "ADD",
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CommonSearchTextfieldWidget(
                    obscureText: false,
                    controller: controller.bodyPartSearchController.value,
                    icon: const Icon(Icons.search,
                        size: 30, weight: 0.5, opticalSize: 0.5),
                  ),
                ),
                10.pw,
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.deepGrey, width: 1)
                    // color: AppColors.buttonColor,
                  ),
                  child: Image.asset(
                    AppAssets.filter,
                    height: 30,
                    width: 35,
                  ),
                )
              ],
            ),
            15.ph,
            Expanded(
                child: Obx(() => controller.filteredBodyPartCategories.isEmpty ?  Center(
                  child: CustomText(text: "No Data Found", textColor: Colors.black, fontWeight: FontWeight.bold, fontSize: AppSizes.size18,),
                ) : GridView.count(
                  mainAxisSpacing: 7,
                  crossAxisSpacing: 4,
                  crossAxisCount: 3,
                  childAspectRatio: (itemWidth / itemHeight),
                  controller: new ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: controller.filteredBodyPartCategories
                      .map((item) => GestureDetector(
                      child: Card(
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                        ),
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(5),
                        //     color: Colors.grey.withOpacity(0.3),
                        //   boxShadow: [
                        //     BoxShadow(
                        //       color: Colors.grey.withOpacity(0.2),
                        //       blurRadius: 4,
                        //       offset: Offset(0, 0), // Shadow position
                        //     ),
                        //   ],
                        // ),
                        child: Column(
                          children: [
                            // Expanded(
                            //   child: ClipRRect(
                            //     borderRadius: BorderRadius.circular(4),
                            //     child: CachedNetworkImage(
                            //       imageUrl: item. ?? '',
                            //       width: width,
                            //       height: double.infinity,
                            //       fit: BoxFit.fill,
                            //       placeholder: (context, url) =>
                            //           Container(
                            //             decoration: BoxDecoration(
                            //               borderRadius:
                            //               BorderRadius.circular(10),
                            //               color: AppColors.grey1,
                            //             ),
                            //             // color: AppColors.primaryColor,
                            //             width: width,
                            //             alignment: Alignment.center,
                            //             child: Container(
                            //               width: 60,
                            //               height: 60,
                            //               child:
                            //               Image.asset(AppAssets.logo),
                            //             ),
                            //           ),
                            //       errorWidget: (context, url, error) =>
                            //           ClipRRect(
                            //             child: Image.asset(
                            //               AppAssets.logo,
                            //               height: double.infinity,
                            //               width: width,
                            //               fit: BoxFit.fill,
                            //             ),
                            //             borderRadius:
                            //             BorderRadius.circular(3),
                            //           ),
                            //     ),
                            //   ),
                            // ),
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(5),
                                        bottomRight:
                                        Radius.circular(5))),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                width:
                                MediaQuery.of(context).size.width,
                                child: CustomText(
                                  text: item.name ?? '',
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w500,
                                  textColor: Colors.black,
                                ))
                          ],
                        ),
                      )))
                      .toList(),
                )))
          ],
        ),
      ),
    );
  }
}
