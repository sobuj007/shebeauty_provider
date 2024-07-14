import 'package:get/get.dart';

import '../../../../core/routes/AppRouts.dart';
class SplashScreenController extends GetxController {
  @override
  void onInit() {
    afterSplash();
    super.onInit();
  }

  void afterSplash() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(AppRoutes.loginScreen);
    });
  }
}