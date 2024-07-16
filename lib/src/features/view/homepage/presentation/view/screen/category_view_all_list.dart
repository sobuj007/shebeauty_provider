import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty_provider/src/core/di/app_component.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/features/view/homepage/presentation/controller/homepage_controller.dart';
import 'package:shebeauty_provider/src/features/widgets/common_appbar/common_appbar.dart';

import '../../../../../../core/routes/AppRouts.dart';
import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../widgets/common_textField_widget/common_textfield_widget.dart';

class CategoryViewAllList extends StatelessWidget {
  CategoryViewAllList({super.key});
  var controller = locator<HomepageController>();
  @override
  Widget build(BuildContext context) {
    var size1 = MediaQuery.of(context).size;
    final double itemHeight = (size1.height - kToolbarHeight - 10) / 8;
    print("height $itemHeight");
    final double itemWidth = size1.width / 4.1;
    print("height $itemWidth");
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonCustomAppBar(
        appbarTitle: "My Category",
        onTap: () {
          Get.toNamed(AppRoutes.addServicesScreen);
        },
        icon: const Icon(Icons.add_box),
        leadingText: "ADD",
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
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
                child: GridView.count(
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 15,
                  crossAxisCount: 3,
                  childAspectRatio: (itemWidth / itemHeight),
                  controller: new ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: controller.cardList
                      .map((item) => GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: new EdgeInsets.only(right: 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: CachedNetworkImage(
                                imageUrl: item['image']!,
                                width: width,
                                height: double.infinity,
                                fit: BoxFit.fill,
                                placeholder: (context, url) => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.grey1,
                                  ),
                                  // color: AppColors.primaryColor,
                                  width: width,
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    child: Image.asset(AppAssets.logo),
                                  ),
                                ),
                                errorWidget: (context, url, error) => ClipRRect(
                                  child: Image.asset(
                                    AppAssets.logo,
                                    height: double.infinity,
                                    width: width,
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            ),
                          )))
                      .toList(),
                ))
          ],
        ),
      ),
    );
  }
}
