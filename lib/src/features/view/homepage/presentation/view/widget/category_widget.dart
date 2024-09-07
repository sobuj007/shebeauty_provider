import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty_provider/src/core/di/app_component.dart';
import 'package:shebeauty_provider/src/core/utils/app_colors.dart';
import 'package:shebeauty_provider/src/features/view/homepage/presentation/controller/homepage_controller.dart';
import 'package:shebeauty_provider/src/features/widgets/common_cached_network_image/common_cached_network_image.dart';

class CategoryWidget extends StatelessWidget {
   CategoryWidget({super.key});
var controller = locator<HomepageController>();
  @override
  Widget build(BuildContext context) {
    return Obx(()=> SizedBox(
      height: 100,
      child: controller.isLoading.value == true ? const Center(
        child: CircularProgressIndicator(),
      ) : ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.getAllProductModel.value.category?.length,
          itemBuilder: (_, index){
            print("the length is ${controller.getAllProductModel.value.category?.length}");
            var item = controller.getAllProductModel.value.category?[index];
            return SizedBox(
              width: 120,
              height: 70,
              child: Card(
                elevation: 0,
                color: AppColors.cardColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: AppColors.deepGrey),
                ),
                child: CommonCachedNetworkImage(imageUrl: item?.image ?? '', borderRadius: 10.0,),
              ),
            );
          }),
    ));
  }
}
