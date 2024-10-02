import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/core/utils/app_colors.dart';
import 'package:shebeauty_provider/src/features/view/auth/login/presentation/controller/login_controller.dart';
import 'package:shebeauty_provider/src/features/view/homepage/presentation/controller/homepage_controller.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_text/custom_text.dart';
import '../../../../../../core/di/app_component.dart';
import '../../../../../../core/routes/AppRouts.dart';
import '../widget/category_widget.dart';
import '../widget/orderList_home_widget.dart';
import '../widget/promotion_banner_widget.dart';
import '../widget/review_widget.dart';

class HomepageScreen extends StatelessWidget {
  HomepageScreen({super.key});
  var controller = locator<HomepageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder(
          init: LoginController(),
          builder: (loginController) {
            return  Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PromotionBannerWidget(controller: controller),
                          10.ph,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Category",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                letterSpacing: 0.25,
                                textColor: AppColors.appColor,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.categoryList);
                                },
                                child: const CustomText(
                                  text: "Edit",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  letterSpacing: 0.25,
                                ),
                              ),
                            ],
                          ),
                          10.ph,
                          CategoryWidget(),
                          10.ph,
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Review",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                letterSpacing: 0.25,
                              ),
                              CustomText(
                                text: "View all",
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                letterSpacing: 0.25,
                              ),
                            ],
                          ),
                          5.ph,
                          ReviewWidget(controller: controller),
                          10.ph,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CustomText(
                                text: "Order List",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                letterSpacing: 0.25,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.orderListDetailsScreen);
                                },
                                child: const CustomText(
                                  text: "View all",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  letterSpacing: 0.25,
                                ),
                              ),
                            ],
                          ),
                          10.ph,
                          OrderlistHomeWidget(
                            scrollDirection: Axis.horizontal,
                            height: 270,
                            from: "Homepage",
                          ),
                          10.ph,
                        ],
                      ),
                    ),
                  ),
                );
          }),
    );
  }
}
