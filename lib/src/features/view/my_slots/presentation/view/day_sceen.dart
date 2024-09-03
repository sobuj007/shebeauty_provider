import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/core/utils/app_colors.dart';
import 'package:shebeauty_provider/src/core/utils/app_sizes.dart';
import 'package:shebeauty_provider/src/features/view/homepage/presentation/controller/homepage_controller.dart';
import 'package:shebeauty_provider/src/features/view/my_slots/presentation/controller/my_slot_create_controller.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_text/custom_text.dart';

import '../../../../../core/di/app_component.dart';
import '../../../../../core/routes/AppRouts.dart';

class DaySceen extends StatelessWidget {
  final HomepageController controller;
   DaySceen({super.key, required this.controller});
var mySlotsController = locator<MySlotCreateController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.appointmentSlotsCreate);
                      },
                      child: Container(
                        height: 27,
                        width: 112,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(),
                        ),
                        child: Center(
                            child: CustomText(
                          text: "Add/Delete",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                        )),
                      ),
                    ),
                  ],
                ),
                10.ph,
                Expanded(
                  child: controller.isLoadingAppointmentSlot.value == true ? const Center(
                    child: CircularProgressIndicator(),
                  ) : controller.appointmentSlotModel.value.data?.isEmpty ?? false ? const Center(
                    child: CustomText(text: "No Data Found"),
                  ) : ListView.builder(
                      itemCount:
                          controller.appointmentSlotModel.value.data?.length,
                      itemBuilder: (_, index) {
                        var item =
                            controller.appointmentSlotModel.value.data?[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          text: item?.myslot?.title ?? ''),
                                      5.ph,
                                      CustomText(
                                          text:
                                              "Appointment Available: ${item?.myslot?.availableOpening ?? ''}"),
                                      5.ph,
                                      CustomText(
                                          text:
                                              "Off day: ${item?.myslot?.offday ?? ''}"),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    CustomText(text: "Time", fontSize: AppSizes.size13, fontWeight: FontWeight.w500,),
                                    CustomText(text: item?.time ?? ''),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          )),
    );
  }
}
