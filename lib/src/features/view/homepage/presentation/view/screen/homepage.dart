import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/core/utils/app_assets.dart';
import 'package:shebeauty_provider/src/core/utils/app_colors.dart';
import 'package:shebeauty_provider/src/features/view/homepage/presentation/controller/homepage_controller.dart';
import 'package:shebeauty_provider/src/features/view/homepage/presentation/view/widget/review_list.dart';
import 'package:shebeauty_provider/src/features/widgets/common_textField_widget/common_textfield_widget.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_text/custom_text.dart';
import '../../../../../../core/di/app_component.dart';
import '../../../../../../core/routes/AppRouts.dart';
import '../../../../../widgets/common_cached_network_image/common_cached_network_image.dart';
import '../widget/category_widget.dart';
import '../widget/orderList_home_widget.dart';

class HomepageScreen extends StatelessWidget {
  HomepageScreen({super.key});
  var controller = locator<HomepageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 98.6,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.textFieldColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 75),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CommonSearchTextfieldWidget(
                            controller: controller.searchController.value,
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
                            color: AppColors.buttonColor,
                          ),
                          child: Image.asset(
                            AppAssets.filter,
                            height: 30,
                            width: 35,
                          ),
                        )
                      ],
                    ),
                    10.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "Category :",
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: 0.25,
                        ),
                        InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.categoryList);
                          },
                          child: CustomText(
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
                    Row(
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
                    ReviewList(controller: controller),
                    10.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "Order List",
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: 0.25,
                        ),
                        InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.orderListDetailsScreen);
                          },
                          child: CustomText(
                            text: "View all",
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            letterSpacing: 0.25,
                          ),
                        ),
                      ],
                    ),
                    10.ph,
                    OrderlistHomeWidget(scrollDirection: Axis.horizontal,),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
