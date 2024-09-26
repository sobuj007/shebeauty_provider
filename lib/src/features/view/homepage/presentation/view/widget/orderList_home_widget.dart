import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/features/view/homepage/presentation/controller/homepage_controller.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_elevatedButton/custom_eleveted_button.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_text/custom_text.dart';

import '../../../../../../core/di/app_component.dart';
import '../../../../../../core/routes/AppRouts.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../widgets/common_cached_network_image/common_cached_network_image.dart';

class OrderlistHomeWidget extends StatelessWidget {
  final Axis scrollDirection;
  final double height;
  final String from;
  OrderlistHomeWidget(
      {super.key,
      required this.scrollDirection,
      required this.height,
      required this.from});
  var controller = locator<HomepageController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          height: height,
          child: controller.isLoadingOrderList.value == true ? const Center(
            child: CircularProgressIndicator(),
          ) : ListView.builder(
              scrollDirection: scrollDirection,
              itemCount: controller.getOrderModel.length,
              itemBuilder: (_, index) {
                var item = controller.getOrderModel[index];

                return SizedBox(
                  width: 230,
                  child: Card(
                      elevation: 6,
                      color: AppColors.cardColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: AppColors.deepGrey),
                      ),
                      child: SizedBox(
                        height: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: CommonCachedNetworkImage(
                                          imageUrl: item.orderProducts?.first
                                                  .serviceProduct?.image ??
                                              '',
                                          borderRadius: 100.0,
                                        ),
                                      ),
                                      10.pw,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: item.orderProducts?.first
                                                    .serviceProduct?.name ??
                                                '',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.15,
                                          ),
                                          CustomText(
                                            text:
                                                "Price: ${item.orderProducts?.first.serviceProduct?.productPrice}৳",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.15,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                10.ph,
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: from == "fromOrderlistFull" ? 140 : 90,
                                  child: CommonCachedNetworkImage(
                                    imageUrl: item.orderProducts?.first
                                            .serviceProduct?.image ??
                                        '',
                                    borderRadius: 0.0,
                                  ),
                                ),
                                10.ph,
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: CustomText(
                                    text: item.orderProducts?.first.serviceProduct
                                            ?.description ??
                                        '',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.15,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            )),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 36,
                                  child: CustomElevatedButton(
                                    onPress: () {
                                      // controller.orderDetailsFunction(id: item.id);
                                      Get.toNamed(AppRoutes.orderDetailsPage, arguments: {
                                        'serviceProduct': item,
                                      },);
                                    },
                                    text: CustomText(
                                      text: "VIEW DETAILE",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      letterSpacing: 1.25,
                                      textColor: HexColor("6200EE"),
                                    ),
                                    color: HexColor("F1E7E7"),
                                  ),
                                ),
                              ),
                            ),
                            10.ph,
                          ],
                        ),
                      )),
                );
              }),
        ));
  }
}
