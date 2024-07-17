import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shebeauty_provider/src/core/di/app_component.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/core/routes/AppRouts.dart';
import 'package:shebeauty_provider/src/features/view/homepage/presentation/controller/homepage_controller.dart';
import 'package:shebeauty_provider/src/features/widgets/common_appbar/common_appbar.dart';
import 'package:shebeauty_provider/src/features/widgets/common_cached_network_image/common_cached_network_image.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_elevatedButton/custom_eleveted_button.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_text/custom_text.dart';

import '../../../../../../core/utils/app_colors.dart';

class OrderDetailsPage extends StatelessWidget {
  OrderDetailsPage({super.key});
  var controller = locator<HomepageController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: Colors.white,
          appBar:  CommonCustomAppBar(
            appbarTitle: "Order",
            onTap: (){
              Get.toNamed(AppRoutes.profileSetting);
            },
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            height: 139,
                            width: 108,
                            child: CommonCachedNetworkImage(
                              imageUrl:
                                  "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                              borderRadius: 2,
                            ),
                          ),
                          10.pw,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomText(
                                  text: "Rohima begom",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  letterSpacing: 0.15,
                                ),
                                10.ph,
                                CustomRow(
                                  heading: "Services 300 TK",
                                  value: "Time: 11:00 AM",
                                ),
                                10.ph,
                                CustomRow(
                                  heading: "Product 300 TK",
                                  value: "Duration 45 min",
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      15.ph,
                      CustomText(
                        text: "Date:",
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                      10.ph,
                      SizedBox(
                        height: 65,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (_, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColors.buttonColor.withOpacity(0.5),
                                border: Border.all(
                                    color: AppColors.buttonColor, width: 1),
                              ),
                              width:
                                  (MediaQuery.of(context).size.width / 5) - 16,
                              height: 60,
                              child: const Center(
                                child:
                                    Icon(Icons.add_photo_alternate, size: 22),
                              ),
                            );
                          },
                        ),
                      ),
                      10.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 0,
                            child: CustomText(
                              text: "Provider gender :",
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.15,
                            ),
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Radio(
                                      value: 1,
                                      groupValue: controller.gender.value,
                                      onChanged: (value) {
                                        controller.gender.value = value!;
                                      }),
                                  Icon(
                                    Icons.boy,
                                    size: 23,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                      value: 2,
                                      groupValue: controller.gender.value,
                                      onChanged: (value) {
                                        controller.gender.value = value!;
                                      }),
                                  Icon(
                                    Icons.girl,
                                    size: 23,
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      15.ph,
                      CustomText(
                        text: "Time Slot:",
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                      10.ph,
                      CustomRow(
                          heading: "Choose Time",
                          value: "11:00 - 11:30 AM",
                          textAlign: TextAlign.end),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Product Quantity",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                color: Colors.transparent,
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {
                                      if (controller.productQuantity.value >
                                          0) {
                                        controller.productQuantity.value--;
                                      } else {
                                        controller.productQuantity.value = 0;
                                      }
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                              15.pw,
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 34,
                                width: 38,
                                color: AppColors.deepGrey,
                                child: Center(
                                  child: CustomText(
                                    text: "${controller.productQuantity.value}",
                                  ),
                                ),
                              ),
                              10.ph,
                              Container(
                                height: 30,
                                width: 30,
                                color: Colors.transparent,
                                child: IconButton(
                                  onPressed: () {
                                    controller.productQuantity.value++;
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      10.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Services Quantity",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                color: Colors.transparent,
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {
                                      if (controller.serviceQuantity.value >
                                          0) {
                                        controller.serviceQuantity.value--;
                                      } else {
                                        controller.serviceQuantity.value = 0;
                                      }
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                              15.pw,
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 34,
                                width: 38,
                                color: AppColors.deepGrey,
                                child: Center(
                                  child: CustomText(
                                    text: "${controller.serviceQuantity.value}",
                                  ),
                                ),
                              ),
                              10.ph,
                              Container(
                                height: 30,
                                width: 30,
                                color: Colors.transparent,
                                child: IconButton(
                                  onPressed: () {
                                    controller.serviceQuantity.value++;
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      10.ph,
                      CustomRow(
                          heading: "Total",
                          value: "600 TK",
                          textAlign: TextAlign.end),
                      10.ph,
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                    color: HexColor("FAF8F8"),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 40),
                    child: Column(
                      children: [
                        CustomRow(
                            heading: "Service Charge",
                            value: "600 TK",
                            textAlign: TextAlign.end),
                        10.ph,
                        CustomRow(
                            heading: "Vat",
                            value: "50",
                            textAlign: TextAlign.end),
                        10.ph,
                        CustomRow(
                            heading: "Total",
                            value: "650 TK",
                            textAlign: TextAlign.end),
                        10.ph,
                        CustomElevatedButton(
                          text: CustomText(
                            text: "Accept",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            letterSpacing: 0.25,
                            textColor: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget CustomRow({
    required String heading,
    required String value,
    TextAlign? textAlign,
  }) {
    return Row(
      children: [
        Expanded(
          child: CustomText(
            text: heading,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            letterSpacing: 0.15,
          ),
        ),
        Expanded(
          child: CustomText(
            text: value,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            letterSpacing: 0.15,
            textAlign: textAlign ?? TextAlign.start,
          ),
        ),
      ],
    );
  }
}
