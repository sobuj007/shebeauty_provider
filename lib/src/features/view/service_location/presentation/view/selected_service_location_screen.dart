import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty_provider/src/core/di/app_component.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
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
      body: Obx(()=> Padding(
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
                children: [
                  Icon(
                    Icons.favorite,
                    color: AppColors.deepPurple,
                    size: 17,
                  ),
                  20.pw,
                  Obx(() => CustomText(
                    text:
                    "Select Item ${controller.locations.isNotEmpty ? controller.locations.length : ''}",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    textColor: AppColors.deepPurple,
                  ))
                ],
              ),
            ),
            10.ph,
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 8.0, // Space between items horizontally
                  runSpacing: 8.0, // Space between items vertically
                  children: List.generate(controller.locations.length, (index) {
                    var item = controller.locations[index];
                    print(item);
                    return Container(
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: AppColors.deepGrey,
                      ),
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min, // To make the container fit the content
                        children: [
                          CustomText(
                            text: item['item'],
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                          IconButton(
                            onPressed: () {

                              if(controller.locations.isNotEmpty){
                                controller.locations.remove(item['item']);
                                controller.locations.length--;
                              }
                            },
                            icon: Icon(Icons.cancel, color: Colors.grey, size: 20,),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),

          ],
        ),
      )),
    );
  }
}
