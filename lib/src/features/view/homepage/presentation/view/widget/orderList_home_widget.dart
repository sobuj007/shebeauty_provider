import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_elevatedButton/custom_eleveted_button.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_text/custom_text.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../widgets/common_cached_network_image/common_cached_network_image.dart';

class OrderlistHomeWidget extends StatelessWidget {
  const OrderlistHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 291,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (_, index) {
            return SizedBox(
              width: 230,
              child: Card(
                  elevation: 6,
                  color: AppColors.cardColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: AppColors.deepGrey),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                imageUrl:
                                    "https://i.pinimg.com/550x/92/dc/1b/92dc1b3063e2cd03df8c48437b7a2e4e.jpg",
                                borderRadius: 100.0,
                              ),
                            ),
                            10.pw,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Shoe",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.15,
                                ),
                                CustomText(
                                  text: "Body 2",
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
                        height: 90,
                        child: CommonCachedNetworkImage(
                          imageUrl:
                              "https://i.pinimg.com/550x/92/dc/1b/92dc1b3063e2cd03df8c48437b7a2e4e.jpg",
                          borderRadius: 0.0,
                        ),
                      ),
                      10.ph,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CustomText(
                          text:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.15,
                          maxLines: 3,
                        ),
                      ),
                      15.ph,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                            height: 36,
                            child: CustomElevatedButton(
                              text: CustomText(
                                text: "VIEW DETAILE",
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                letterSpacing: 1.25,
                                textColor: HexColor("6200EE"),
                              ),
                              color: HexColor("F1E7E7"),
                            )),
                      )
                    ],
                  )),
            );
          }),
    );
  }
}
