import 'package:flutter/material.dart';

class ChildPreferredSizeTabBar extends StatelessWidget
    implements PreferredSizeWidget {
  final double _childTabBarHeight = 0.0;
  final Widget widget;

  const ChildPreferredSizeTabBar({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return widget;
  }

  @override
  Size get preferredSize => Size.fromHeight(_childTabBarHeight);
}
