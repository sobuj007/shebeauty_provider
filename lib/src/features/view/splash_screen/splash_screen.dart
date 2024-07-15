import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import 'controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
        init: SplashScreenController(),
        builder: (controller) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 9,
                  child: Center(
                    child: Image.asset(
                      AppAssets.logo,
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      backgroundColor: AppColors.appColor,
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          );
        }
    );
  }
}