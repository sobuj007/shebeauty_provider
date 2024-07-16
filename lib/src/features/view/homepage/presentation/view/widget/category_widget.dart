import 'package:flutter/material.dart';
import 'package:shebeauty_provider/src/core/utils/app_colors.dart';
import 'package:shebeauty_provider/src/features/widgets/common_cached_network_image/common_cached_network_image.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (_, index){
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
                child: CommonCachedNetworkImage(imageUrl: "https://i.pinimg.com/550x/92/dc/1b/92dc1b3063e2cd03df8c48437b7a2e4e.jpg", borderRadius: 10.0,),
              ),
            );
          }),
    );
  }
}
