import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty_provider/src/core/utils/app_sizes.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_text/custom_text.dart';

import '../../../core/utils/app_colors.dart';

class CommonCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String appbarTitle;
  final String? leadingText;
  final VoidCallback? onTap;
  final Icon? icon;
  final bool? showActionButton;
  const CommonCustomAppBar(
      {super.key,
      required this.appbarTitle,
      this.onTap,
      this.icon,
      this.leadingText,
      this.showActionButton
      });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: CustomText(text: appbarTitle, fontSize: AppSizes.size18, fontWeight: FontWeight.bold,),
      titleTextStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: "Roboto",
          color: Colors.black),
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
          )),
      actions: showActionButton == true ? null : [
        Row(
          children: [
            if (leadingText?.isNotEmpty ?? false)
              CustomText(
                text: leadingText ?? '',
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            IconButton(
              onPressed: onTap,
              icon: icon ??
                  Icon(
                    Icons.notifications,
                    size: 21,
                    color: AppColors.appColor,
                  ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
