import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shebeauty_provider/src/core/di/app_component.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/core/routes/AppRouts.dart';
import 'package:shebeauty_provider/src/features/view/service_location/presentation/controller/service_location_controller.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../widgets/common_appbar/common_appbar.dart';
import '../../../../widgets/custom_text/custom_text.dart';

class SelectedServiceLocationScreen extends StatelessWidget {
  SelectedServiceLocationScreen({super.key});
  var controller = locator<ServiceLocationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonCustomAppBar(
        appbarTitle: "Services Location",
        onTap: () {},
      ),
      body: Obx(() => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20),
                  height: 48,
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.deepPurple.withOpacity(0.2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: AppColors.deepPurple,
                            size: 17,
                          ),
                          20.pw,
                          Obx(() => CustomText(
                                text:
                                    "Select Item ${controller.selectedlocations.isNotEmpty ? controller.selectedlocations.length : ''}",
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                textColor: AppColors.deepPurple,
                              ))
                        ],
                      ),
                      Visibility(
                          visible: controller.selectedlocations.isNotEmpty
                              ? true
                              : false,
                          child: IconButton(
                              onPressed: () async {
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                        List<String>? selectedStringList = prefs.getStringList('customObjectList');
                        controller.selectedlocations.value = selectedStringList ?? [];
                        // Save the list to SharedPreferences
                        await saveSelectedLocations();
                                Get.toNamed(AppRoutes.serviceLocationScreen);
                              },
                              icon: Icon(Icons.edit)))
                    ],
                  ),
                ),
                10.ph,
                Expanded(
                  child: SingleChildScrollView(
                    child: Wrap(
                      spacing: 8.0, // Space between items horizontally
                      runSpacing: 8.0, // Space between items vertically
                      children: List.generate(
                          controller.selectedlocations.length, (index) {
                        // Assuming each item in selectedlocations is a JSON string
                        var itemJson = controller.selectedlocations[index];

                        // Parse the JSON string to a Map
                        var item = jsonDecode(itemJson);

                        // Extract the 'name' from the Map
                        String name = item['name'];

                        return Container(
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            color: AppColors.deepGrey,
                          ),
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize
                                .min, // To make the container fit the content
                            children: [
                              CustomText(
                                text: name,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                              IconButton(
                                onPressed: () {
                                  // Remove item from controller.locations if exists
                                  // controller.selectedlocations.removeWhere((loc) => jsonDecode(loc)['id'] == item['id']);
                                  controller.removeLocation(itemJson); // Remove item from the list
                                saveSelectedLocations();
                                },
                                icon: Icon(
                                  Icons.cancel,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
Future<void> saveSelectedLocations() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Convert RxList to List<String>
    List<String> stringList = controller.selectedlocations
        .map((item) => item.toString()) // Ensure each item is a String
        .toList();
    await prefs.setStringList('customObjectList', stringList);
  }
}
