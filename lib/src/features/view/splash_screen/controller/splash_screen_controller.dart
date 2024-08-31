import 'package:get/get.dart';
import 'package:shebeauty_provider/src/features/view/auth/login/presentation/controller/login_controller.dart';

import '../../../../../main.dart';
import '../../../../core/di/app_component.dart';
import '../../../../core/routes/AppRouts.dart';
import '../../../../core/source/dio_client.dart';
class SplashScreenController extends GetxController {
  var signInController = locator<LoginController>();
  @override
  void onInit() {
    afterSplash();
    super.onInit();
  }

  void afterSplash() {
    Future.delayed(const Duration(seconds: 3), () async {
      if((session.getEmail?.isNotEmpty ?? false) && (session.getPassword?.isNotEmpty ?? false)){
        signInController.submitLoginData(navigatorKey.currentContext!);
      }else{
        Get.offNamed(AppRoutes.loginScreen);
      }
    });
  }
}