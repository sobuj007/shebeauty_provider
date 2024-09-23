import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:shebeauty_provider/src/core/utils/app_colors.dart';
import 'package:shebeauty_provider/src/core/utils/app_sizes.dart';
import 'package:shebeauty_provider/src/features/view/profile_screen/presentation/view/profile_setting_screen.dart';

import '../../../core/source/dio_client.dart';
import '../../../core/utils/app_assets.dart';
import '../../widgets/custom_text/custom_text.dart';
import '../homepage/presentation/view/screen/homepage.dart';
import '../homepage/presentation/view/screen/order_list_full_screen.dart';
import '../profile_screen/presentation/view/profile_screen.dart';


class ParentScreen extends StatefulWidget {
  const ParentScreen({Key? key}) : super(key: key);
  @override
  State<ParentScreen> createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen> {
  late PersistentTabController _controller;
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _widgetOptions = <Widget>[
      HomepageScreen(),
      OrderListFullScreen(from: "parentScreen"),
      ProfileScreen(),
      // Add more screens as needed
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home, color: Colors.black,),
        title: ("Home"),
        activeColorPrimary: HexColor("F3FBFF"),
        inactiveColorPrimary: Colors.black,
        activeColorSecondary: Colors.black,
        textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.15)
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_cart, color: Colors.black,),
        title: ("Profile"),
          activeColorPrimary: HexColor("F3FBFF"),
          inactiveColorPrimary: Colors.black,
          activeColorSecondary: Colors.black,
          textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.15)
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(AppAssets.user, height: 30, width: 30,color: Colors.black,),
        title: ("Profile"),
          activeColorPrimary: HexColor("F3FBFF"),
          inactiveColorPrimary: Colors.black,
          activeColorSecondary: Colors.black,
          textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.15)
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        title: CustomText(text: "Welcome, ${session.getFullName ?? ''}", textColor: AppColors.appColor, fontSize: AppSizes.size16,),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              // Add action here
            },
            icon: Icon(
              Icons.notifications,
              size: 21,
              color: AppColors.appColor,
            ),
          )
        ],
      ),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _widgetOptions,
        items: _navBarsItems(),
        backgroundColor: AppColors.deepGrey, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when the keyboard appears.
        stateManagement: true, // Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(0.0),
          colorBehindNavBar: Colors.white,
        ),
        navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
      ),
    );
  }
}