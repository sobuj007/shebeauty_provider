import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_text/custom_text.dart';

class CommonCustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String appbarTitle;
  final String? leadingText;
  final VoidCallback? onTap;
  final Icon? icon;
  const CommonCustomAppBar({super.key, required this.appbarTitle, this.onTap, this.icon, this.leadingText});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(appbarTitle),
      titleTextStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontFamily: "Roboto", color: Colors.black),
      leading: IconButton(onPressed: (){
        Get.back();
      }, icon: const Icon(Icons.arrow_back_ios, size: 30,)),

      actions: [
        Row(
          children: [
            if(leadingText?.isNotEmpty ?? false)
            CustomText(text: leadingText ?? '', fontWeight: FontWeight.w400, fontSize: 16,),
            IconButton(onPressed: onTap, icon: icon ?? const Icon(Icons.notifications_none, size: 21,)),
          ],
        )
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
