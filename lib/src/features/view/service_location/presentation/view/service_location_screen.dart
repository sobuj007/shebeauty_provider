import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shebeauty_provider/src/core/di/app_component.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/core/utils/app_colors.dart';
import 'package:shebeauty_provider/src/features/widgets/common_appbar/common_appbar.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_text/custom_text.dart';

import '../../../../../core/routes/AppRouts.dart';
import '../controller/service_location_controller.dart';

class ServiceLocationScreen extends StatelessWidget {
  ServiceLocationScreen({super.key});
  var controller = locator<ServiceLocationController>();
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
              padding: EdgeInsets.only(left: 20),
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
                itemCount: controller.item.length,
                itemBuilder: (_, index) {
                  var item = controller.item[index];
                  return InkWell(
                    onTap: () {
                      controller.selectIndex.value = index;

                      if (!controller.locations.contains(item)) {
                        controller.locations.add(item);
                      }
                    },
                    child: Obx(() => Container(
                          padding: EdgeInsets.only(left: 20),
                          margin: EdgeInsets.only(bottom: 10),
                          height: 48,
                          width: MediaQuery.of(context).size.width * 0.7,
                          color: controller.selectIndex.value == index
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
                                text: "${item["item"]}",
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
        onPressed: () {
          if(controller.locations.isEmpty){
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(
              content: Text("Please select a location"),
              elevation: 0,
              backgroundColor: AppColors.deepPurple.withOpacity(0.6),
              
            ));
          }else{
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
          child: Center(
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
