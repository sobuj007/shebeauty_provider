import 'package:flutter/material.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/core/utils/app_colors.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_text/custom_text.dart';

class DaySceen extends StatelessWidget {
  const DaySceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 27,
                  width: 112,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(),
                  ),
                  child: Center(
                      child: CustomText(
                    text: "Add/Delete",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                  )),
                ),
                Container(
                  height: 27,
                  width: 112,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.deepGrey),
                  child: Center(
                      child: CustomText(
                    text: "Open",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                  )),
                ),
              ],
            ),
            10.ph,
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 17.0, // Space between items horizontally
                  runSpacing: 15.0, // Space between items vertically
                  children: List.generate(9, (index) {
                    return Container(
                      height: 70,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: AppColors.deepGrey,
                      ),
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize
                            .min, // To make the container fit the content
                        children: [
                          CustomText(
                            text: "",
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
