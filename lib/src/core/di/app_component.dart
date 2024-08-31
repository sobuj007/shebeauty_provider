import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shebeauty_provider/src/features/view/expart_worker_screen/presentation/controller/expert_worker_controller.dart';
import 'package:shebeauty_provider/src/features/view/homepage/presentation/controller/homepage_controller.dart';
import 'package:shebeauty_provider/src/features/view/profile_screen/presentation/controller/profile_controller.dart';
import 'package:shebeauty_provider/src/features/view/services/presentation/controller/service_controller.dart';
import 'package:shebeauty_provider/src/features/view/splash_screen/controller/splash_screen_controller.dart';

import '../../features/view/auth/login/data/repository/login_repository_impl.dart';
import '../../features/view/auth/login/data/source/login_service.dart';
import '../../features/view/auth/login/domain/repository/login_repository.dart';
import '../../features/view/auth/login/presentation/controller/login_controller.dart';
import '../../features/view/auth/signup_screen/data/repository/reg_repository_impl.dart';
import '../../features/view/auth/signup_screen/data/source/reg_service.dart';
import '../../features/view/auth/signup_screen/domain/repository/reg_repository.dart';
import '../../features/view/auth/signup_screen/presentation/controller/signup_controller.dart';
import '../../features/view/service_location/presentation/controller/service_location_controller.dart';
import '../network/configuration.dart';
import '../source/dio_client.dart';
import '../source/pref_manager.dart';
import '../source/session_manager.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerFactory<Dio>(() =>
  Dio()
    ..interceptors.add(InterceptorsWrapper()));
  locator.registerFactory<DioClient>(() => DioClient(locator<Dio>()));
  //splash screen
  locator.registerFactory<SplashScreenController>(() => Get.put(SplashScreenController()));
  //sign in screen
  locator.registerFactory<LoginController>(() => Get.put(LoginController()));
  locator.registerFactory<SignInService>(() => SignInService());
  locator.registerFactory<SignInRepository>(
          () => SignInRepositoryImpl(locator<SignInService>()));
  //sign up screen
  locator.registerFactory<SignupController>(() => Get.put(SignupController()));
  locator.registerFactory<RegService>(() => RegService());
  locator.registerFactory<RegRepository>(
          () => RegRepositoryImpl(locator<RegService>()));

  //experts worker
  locator.registerFactory<ExpertWorkerController>(() => Get.put(ExpertWorkerController()));

  // profile screen
  locator.registerFactory<ProfileController>(() => Get.put(ProfileController()));
  locator.registerFactory<HomepageController>(() => Get.put(HomepageController()));
  locator.registerFactory<ServiceController>(() => Get.put(ServiceController()));
  locator.registerFactory<ServiceLocationController>(() => Get.put(ServiceLocationController()));

  //session
  locator.registerSingletonAsync<SessionManager>(() async =>
  SessionManager(PrefManager(await SharedPreferences.getInstance())));
}