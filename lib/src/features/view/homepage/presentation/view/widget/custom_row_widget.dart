import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';

import '../../../../../../core/routes/AppRouts.dart';
import '../../../../../widgets/custom_text/custom_text.dart';

class CustomRowWidget extends StatelessWidget {
  final String firstTitle, secondTitle;
  final VoidCallback? onPress;
  final IconData? icon;
  const CustomRowWidget({super.key, required this.firstTitle, required this.secondTitle, this.onPress, this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: firstTitle,
          fontWeight: FontWeight.w600,
          fontSize: 16,
          letterSpacing: 0.25,
        ),
        InkWell(
          onTap: onPress,
          child: Row(
            children: [
              CustomText(
                text: secondTitle,
                fontWeight: FontWeight.w600,
                fontSize: 12,
                letterSpacing: 0.25,
              ),
              10.pw,
              if(icon.toString().isNotEmpty)
              Icon(icon)
            ],
          ),
        ),
      ],
    );
  }
}
