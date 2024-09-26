import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty_provider/src/features/view/homepage/presentation/controller/homepage_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../../../widgets/custom_text/custom_text.dart';

class PromotionBannerWidget extends StatelessWidget {
  final HomepageController controller;
  const PromotionBannerWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Visibility(
      visible: controller.promotionBannerModel.value.data?.isEmpty ?? false ? false : true,
      child: Container(
        height: 19.h,
        child: controller.promotionBannerModel.value.data
            ?.isNotEmpty ??
            false
            ? Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 0.h, vertical: 1.h),
          child: Swiper(
            itemBuilder:
                (BuildContext context, int index) {
              return SizedBox(
                height: 150,
                width:
                MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    imageUrl: controller
                        .promotionBannerModel
                        .value
                        .data?[index]
                        .image ??
                        '',
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            colorFilter:
                            const ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                      ),
                    ),
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              );
            },
            autoplay: true,
            duration: 1000,
            autoplayDelay: 8000,
            itemCount: controller.promotionBannerModel
                .value.data?.length ??
                0,
            viewportFraction: 1,
            scale: 0.9,
          ),
        )
            : const Center(child: CustomText(text: "")),
      ),
    ));
  }
}
