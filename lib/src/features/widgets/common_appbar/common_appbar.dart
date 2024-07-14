import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonCustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String appbarTitle;
  const CommonCustomAppBar({super.key, required this.appbarTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(appbarTitle),
      titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontFamily: "Roboto", color: Colors.black),
      leading: IconButton(onPressed: (){
        Get.back();
      }, icon: Icon(Icons.arrow_back_ios, size: 30,)),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none, size: 21,))
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
