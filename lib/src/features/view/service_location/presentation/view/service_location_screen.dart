import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shebeauty_provider/src/core/di/app_component.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/core/utils/app_colors.dart';
import 'package:shebeauty_provider/src/features/view/homepage/presentation/controller/homepage_controller.dart';
import 'package:shebeauty_provider/src/features/widgets/common_appbar/common_appbar.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_text/custom_text.dart';

import '../../../../../core/routes/AppRouts.dart';
import '../controller/service_location_controller.dart';

class ServiceLocationScreen extends StatelessWidget {
  ServiceLocationScreen({super.key});
  var controller = locator<ServiceLocationController>();
  var homepageController = locator<HomepageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonCustomAppBar(
        appbarTitle: "Services Location",
        onTap: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            10.ph,
            Container(
              padding: const EdgeInsets.only(left: 20),
              height: 48,
              width: MediaQuery.of(context).size.width,
              color: AppColors.deepPurple.withOpacity(0.2),
              child: Row(
                children: [
                  Icon(
                    Icons.favorite,
                    color: AppColors.deepPurple,
                    size: 17,
                  ),
                  20.pw,
                  Obx(() => CustomText(
                        text:
                            "Select Item ${controller.locations.length > 0 ? controller.locations.length : ''}",
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        textColor: AppColors.deepPurple,
                      ))
                ],
              ),
            ),
            20.ph,
            Expanded(
              child: ListView.builder(
                itemCount: homepageController
                    .getAllProductModel.value.location?.length,
                itemBuilder: (_, index) {
                  var item = homepageController
                      .getAllProductModel.value.location?[index];
                  return InkWell(
                    onTap: () {
                      controller.selectIndex.value = index;

                      if (controller.locations.contains(item)) {
                        controller.locations.remove(item);
                      } else {
                        controller.locations.add(item);
                      }
                      print("items ${controller.selectedlocations}");
                      controller.update();
                    },
                    child: Obx(() => Container(
                          padding: const EdgeInsets.only(left: 20),
                          margin: const EdgeInsets.only(bottom: 10),
                          height: 48,
                          width: MediaQuery.of(context).size.width * 0.7,
                          color: controller.selectedlocations.isNotEmpty &&  controller.selectedlocations.contains(item)? AppColors.deepPurple.withOpacity(0.2)  : controller.locations.contains(item)
                              ? AppColors.deepPurple.withOpacity(0.2)
                              : Colors.transparent,
                          child: Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                color: (index % 4) == 0
                                    ? controller.color[0]
                                    : (index % 3) == 0
                                        ? controller.color[1]
                                        : (index % 2) == 0
                                            ? controller.color[2]
                                            : controller.color[3],
                                size: 17,
                              ),
                              20.pw,
                              CustomText(
                                text: "${item?.name}",
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                textColor: AppColors.deepPurple,
                              )
                            ],
                          ),
                        )),
                  
                  );
                },
              ),
            
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (controller.locations.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text("Please select a location"),
              elevation: 0,
              backgroundColor: AppColors.deepPurple.withOpacity(0.6),
            ));
          } else {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            List<String> stringList = controller.locations
                .map((item) => jsonEncode(item.toJson()))
                .toList();
            await prefs.setStringList('customObjectList', stringList);
            List<String>? selectedStringList = prefs.getStringList('customObjectList');
           controller.selectedlocations.value = selectedStringList ?? [];
            Get.toNamed(AppRoutes.selectedServiceLocationScreen);
          }
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(500),
              color: AppColors.deepPurple.withOpacity(0.7)),
          child: const Center(
            child: Icon(
              Icons.arrow_forward,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
