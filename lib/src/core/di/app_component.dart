import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shebeauty_provider/src/features/view/auth/login/controller/login_controller.dart';
import 'package:shebeauty_provider/src/features/view/profile_screen/presentation/controller/profile_controller.dart';

import '../../features/view/auth/signup_screen/presentation/controller/signup_controller.dart';

final locator = GetIt.instance;

Future<void> init() async {
  // locator.registerFactory<Dio>(() =>
  // Dio(NetworkConfiguration.baseOptions)
  //   ..interceptors.add(InterceptorsWrapper()));

  locator.registerFactory<LoginController>(() => Get.put(LoginController()));
  locator.registerFactory<SignupController>(() => Get.put(SignupController()));
  locator.registerFactory<ProfileController>(() => Get.put(ProfileController()));
}