import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/core/utils/app_sizes.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/di/app_component.dart';
import '../../../../../../core/routes/AppRouts.dart';
import '../../../../../../core/utils/appFonts.dart';
import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../widgets/common_appbar/common_appbar.dart';
import '../../../../../widgets/common_textField_widget/common_textfield_widget.dart';
import '../../../../../widgets/custom_text/custom_text.dart';
import '../../../data/model/get_all_product_model.dart';
import '../../controller/homepage_controller.dart';

class SubCategoryListPage extends StatelessWidget {
  SubCategoryListPage({super.key});
  @override
  Widget build(BuildContext context) {
    // final category = Get.arguments['subCategory'] == null ? [] as Category : Get.arguments['subCategory'] as Category?;
    // final Category? category = Get.arguments['category'] as Category?;
    Category? category;
    try {
      category = Get.arguments['category'] as Category?;
    } catch (e) {
      category = null; // Safely handle any casting issues
    }
    var size1 = MediaQuery.of(context).size;
    final double itemHeight = (size1.height - kToolbarHeight - 10) / 6;
    final double itemWidth = size1.width / 4.1;
    var width = MediaQuery.of(context).size.width;
    return GetBuilder(
      init: HomepageController(),
      builder: (controller) {
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
          body: GetBuilder(
            init: HomepageController(),
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() {
                          return Expanded(
                            child: CommonSearchTextfieldWidget(
                              obscureText: false,
                              controller: controller.subCategorySearchController.value,
                              icon: const Icon(Icons.search, size: 30),
                              onChanged: (s){
                                controller.subCategoryFilterCategories(s, category);
                              },
                            ),
                          );
                        }),
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
                        child: Obx(() => controller.filteredSubCategories.isEmpty
                            ? Center(
                                child: CustomText(
                                  text: "No Data Found",
                                  textColor: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppSizes.size18,
                                ),
                              )
                            : GridView.count(
                                mainAxisSpacing: 7,
                                crossAxisSpacing: 4,
                                crossAxisCount: 3,
                                childAspectRatio: (itemWidth / itemHeight),
                                controller:
                                    new ScrollController(keepScrollOffset: false),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: controller.filteredSubCategories
                                    .map((item) => GestureDetector(
                                        onTap: () {
                                          // controller.filteredBodyPartCategories.value =
                                          //     controller.allBodyPartCategories
                                          //         .where((bodyPart) =>
                                          //             item.id.toString() ==
                                          //             bodyPart.subcategoryId)
                                          //         .toList();
                                           showpopup(context, item.id, controller);
                                          // Get.toNamed(
                                          //   AppRoutes.bodyPart,
                                          //   arguments: {
                                          //     'subcategory': item,
                                          //   },
                                          // );
                                        },
                                        child: Card(
                                          color: Colors.white,
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5)),
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
                                              Expanded(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  child: CachedNetworkImage(
                                                    imageUrl: item.image ?? '',
                                                    width: width,
                                                    height: double.infinity,
                                                    fit: BoxFit.fill,
                                                    placeholder: (context, url) =>
                                                        Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(10),
                                                        color: AppColors.grey1,
                                                      ),
                                                      // color: AppColors.primaryColor,
                                                      width: width,
                                                      alignment: Alignment.center,
                                                      child: Container(
                                                        width: 60,
                                                        height: 60,
                                                        child:
                                                            Image.asset(AppAssets.logo),
                                                      ),
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            ClipRRect(
                                                      child: Image.asset(
                                                        AppAssets.logo,
                                                        height: double.infinity,
                                                        width: width,
                                                        fit: BoxFit.fill,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(3),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey
                                                          .withOpacity(0.1),
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                              bottomLeft:
                                                                  Radius.circular(5),
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
              );
            }
          ),
        );
      }
    );
  }
  showpopup(context, id, HomepageController homeController) {
    showModalBottomSheet(
        context: context,
        builder: ((context) {
          return Obx(() {
            if (homeController.allSubCategories == null) {
              return Center(child: CircularProgressIndicator());
            }

            if (homeController.allBodyPartCategories!.isEmpty) {
              return Center(child: Text('No Body part available'));
            }
            final data = homeController.filterBodypartsByName(id.toString());
            var listdata = data;
            return Container(
              // height: 15.h+(5.h*bodypart.length/2),
              height: 30.h + (5.h),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: data.isEmpty ?  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Center(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('No Body part available'),

                        IconButton(onPressed: (){
                          Navigator.pop(context);
                          Get.toNamed(AppRoutes.addServicesScreen);
                        }, icon: Icon(Icons.add_circle_outlined, size: 40,))
                      ],
                    ))): Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Body Part:",
                      style: AppFonts.fontH4semi(AppColors.themeBlack),
                    ),
                    GroupButton(
                      options: GroupButtonOptions(
                          groupingType: GroupingType.wrap,
                          spacing: 5,
                          runSpacing: 5,
                          borderRadius: BorderRadius.circular(5),
                          textPadding: EdgeInsets.symmetric(
                              horizontal: 1, vertical: .5),
                          selectedColor: Colors.amberAccent,
                          unselectedTextStyle:
                          AppFonts.fontH7semi(Colors.black),
                          selectedTextStyle: AppFonts.fontH7semi(Colors.black)),
                      isRadio: false,
                      onSelected: ((value, index, isSelected) {
                        if (isSelected) {
                          homeController.selectedBodyValue.add(index.toString());
                        } else {
                          homeController.selectedBodyValue.remove(index.toString());
                        }
// For debugging purposes
                      }),
                      buttons: data,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  Get.toNamed(AppRoutes.addServicesScreen);
                                  // Future.delayed(Duration.zero, () async {
                                  //   Get.to(MyProvider2(), arguments: {
                                  //     "subcategory": con.subcategories,
                                  //     "bodypart": selectedBodyValue,
                                  //     "subid": id
                                  //   });
                                  // });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: AppColors.appColor,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Search",
                                      style: AppFonts.fontH4bold(
                                          AppColors.white),
                                    ),
                                  ),
                                ))),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
        }));
  }
}
