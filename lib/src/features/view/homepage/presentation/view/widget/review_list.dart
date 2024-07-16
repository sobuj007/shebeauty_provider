import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shebeauty_provider/src/features/view/homepage/presentation/controller/homepage_controller.dart';

import '../../../../../widgets/common_cached_network_image/common_cached_network_image.dart';
import '../../../../../widgets/custom_text/custom_text.dart';

class ReviewList extends StatelessWidget {
  final HomepageController controller;
  const ReviewList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 140.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 10,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 1.0,
        ),
        items: controller.cardList
            .map((item) => Container(
          width: double.maxFinite,
          color: Colors.white,
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(5.0),
            ),
            elevation: 0.0,
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    height: 57,
                    width: 57,
                    child: CommonCachedNetworkImage(
                      imageUrl: item['image']!,
                      borderRadius: 100.0,
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      CustomText(
                        text: item['name']!,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.15,
                      ),
                      SizedBox(height: 3.0),
                      CustomText(
                        text: item['description']!,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ))
            .toList(),
      ),
    );
  }
}
