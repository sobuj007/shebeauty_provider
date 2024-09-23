import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty_provider/src/core/network/configuration.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/utils/appFonts.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../controller/homepage_controller.dart';

class ReviewWidget extends StatelessWidget {
  final HomepageController controller;
  const ReviewWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      width: 100.w,
      child: Obx(() {
        // Show a loading indicator when data is being fetched
        if (controller.isReviewModelLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        // Show the swiper with reviews if available
        if (controller.reviewModel.value.reviews?.isEmpty ?? false) {
          return Center(child: Text('No reviews available'));
        }

        return Swiper(
          itemBuilder: (BuildContext context, int index) {
            var review = controller.reviewModel.value.reviews?[index];
            return Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  // Display reviewer's image if available
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: CachedNetworkImageProvider(
                      review?.image==null ? "https://via.placeholder.com/150": NetworkConfiguration.profileimg+(review?.image.toString() ?? ''), // Use a placeholder if image is null
                    ),
                  ),
                  SizedBox(height: 1.h),
                  // Display reviewer's name
                  Text(
                    review?.reviewername ?? "Unknown",
                    style: AppFonts.fontH6semi(AppColors.appColor),
                  ),
                  SizedBox(height: 1.h),
                  // Display reviewer's comment
                  Text(
                    review?.comment ?? "No comment provided",
                    style: AppFonts.fontH7normal(AppColors.themeBlack),
                    textAlign: TextAlign.center,
                  ),

                ],
              ),
            );
          },
          autoplay: true,
          duration: 1000,
          autoplayDelay: 8000,
          itemCount: controller.reviewModel.value.reviews?.length ?? 0, // Use the length of reviewsList
          viewportFraction: 1,
          scale: 0.9,
        );
      }),
    );
  }
}
