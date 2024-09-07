import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shebeauty_provider/src/features/view/expart_worker_screen/data/source/experts_create_service.dart';
import 'package:shebeauty_provider/src/features/view/expart_worker_screen/presentation/controller/expert_worker_controller.dart';
import 'package:shebeauty_provider/src/features/view/homepage/presentation/controller/homepage_controller.dart';
import 'package:shebeauty_provider/src/features/view/my_slots/data/source/myslot_creation_service.dart';
import 'package:shebeauty_provider/src/features/view/my_slots/presentation/controller/my_slot_create_controller.dart';
import 'package:shebeauty_provider/src/features/view/profile_screen/presentation/controller/profile_controller.dart';
import 'package:shebeauty_provider/src/features/view/services/data/source/service_service.dart';
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
import '../../features/view/expart_worker_screen/data/repository/experts_create_repository_impl.dart';
import '../../features/view/expart_worker_screen/domain/repository/experts_create_repository.dart';
import '../../features/view/homepage/data/repository/get_all_product_repository_impl.dart';
import '../../features/view/homepage/data/source/get_all_product_service.dart';
import '../../features/view/homepage/domain/repository/get_all_product_repository.dart';
import '../../features/view/my_slots/data/repository/myslot_creation_repository_impl.dart';
import '../../features/view/my_slots/domain/repository/myslot_creation_repository.dart';
import '../../features/view/profile_screen/data/repository/store_profile_repository_impl.dart';
import '../../features/view/profile_screen/data/source/store_profile_service.dart';
import '../../features/view/profile_screen/domain/repository/store_profile_repository.dart';
import '../../features/view/service_location/presentation/controller/service_location_controller.dart';
import '../../features/view/services/data/repository/service_repository_impl.dart';
import '../../features/view/services/domain/repository/service_repository.dart';
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
  locator.registerFactory<ExpartCreateService>(() => ExpartCreateService());
  locator.registerFactory<ExpartCreateRepository>(
          () => ExpartCreateRepositoryImpl(locator<ExpartCreateService>()));

  // homepage
  locator.registerFactory<HomepageController>(() => Get.put(HomepageController()));
  locator.registerFactory<GetAllProductService>(() => GetAllProductService());
  locator.registerFactory<GetAllProductRepository>(
          () => GetAllProductRepositoryImpl(locator<GetAllProductService>()));



  // homepage
  locator.registerFactory<MySlotCreateController>(() => Get.put(MySlotCreateController()));
  locator.registerFactory<MySlotCreateService>(() => MySlotCreateService());
  locator.registerFactory<MySlotCreateRepository>(
          () => MySlotCreateRepositoryImpl(locator<MySlotCreateService>()));

//service
  locator.registerFactory<ServiceController>(() => Get.put(ServiceController()));
  locator.registerFactory<ServiceProductService>(() => ServiceProductService());
  locator.registerFactory<ServiceRepository>(
          () => ServiceRepositoryImpl(locator<ServiceProductService>()));



//store profile
  locator.registerFactory<ProfileController>(() => Get.put(ProfileController()));
  locator.registerFactory<StoreProfileService>(() => StoreProfileService());
  locator.registerFactory<StoreProfileRepository>(
          () => StoreProfileRepositoryImpl(locator<StoreProfileService>()));



  locator.registerFactory<ServiceLocationController>(() => Get.put(ServiceLocationController()));

  //session
  locator.registerSingletonAsync<SessionManager>(() async =>
  SessionManager(PrefManager(await SharedPreferences.getInstance())));
}