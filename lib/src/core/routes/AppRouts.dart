import 'package:get/get.dart';
import 'package:shebeauty_provider/src/features/view/homepage/presentation/view/screen/homepage.dart';
import 'package:shebeauty_provider/src/features/view/profile_screen/presentation/view/profile_setting_screen.dart';
import 'package:shebeauty_provider/src/features/view/service_location/presentation/view/service_location_screen.dart';
import '../../features/view/auth/login/presentation/screen/login_screen.dart';
import '../../features/view/auth/signup_screen/presentation/view/signup_screen.dart';
import '../../features/view/expart_worker_screen/presentation/view/expert_worker_screen.dart';
import '../../features/view/homepage/presentation/view/screen/order_details_page.dart';
import '../../features/view/homepage/presentation/view/screen/order_list_full_screen.dart';
import '../../features/view/my_slots/presentation/view/my_slots_screen.dart';
import '../../features/view/service_location/presentation/view/selected_service_location_screen.dart';
import '../../features/view/services/presentation/view/add_services.dart';
import '../../features/view/homepage/presentation/view/screen/category_view_all_list.dart';
import '../../features/view/homepage/presentation/view/screen/services_screen.dart';
import '../../features/view/parent_page/parent_screen.dart';
import '../../features/view/splash_screen/splash_screen.dart';
import '../../features/view/wallet/presentation/view/wallet_screen.dart';

abstract class AppRoutes {
  AppRoutes._();
  static const splash = _Path.Splash;
  static const loginScreen = _Path.login;
  static const signupScreen = _Path.signup;
  static const signupScreenSetInformation = _Path.signupScreenSetInformation;
  static const profileSetting = _Path.profileSetting;
  static const homepage = _Path.homepage;
  static const parentScreen = _Path.parentScreen;
  static const categoryList = _Path.categoryList;
  static const servicesScreen = _Path.servicesScreen;
  static const addServicesScreen = _Path.addServicesScreen;
  static const orderListDetailsScreen = _Path.orderListDetailsScreen;
  static const orderDetailsPage = _Path.orderDetailsPage;
  static const serviceLocationScreen = _Path.serviceLocationScreen;
  static const selectedServiceLocationScreen = _Path.selectedServiceLocationScreen;
  static const walletScreen = _Path.walletScreen;
  static const mySlotsScreen = _Path.mySlotsScreen;
}

abstract class _Path {
  _Path._();

  static const Splash = "/splash";
  static const login = "/login";
  static const signup = "/signup";
  static const signupScreenSetInformation = "/signupScreenSetInformation";
  static const profileSetting = "/profileSetting";
  static const homepage = "/homepage";
  static const parentScreen = "/parentScreen";
  static const categoryList = "/categoryList";
  static const servicesScreen = "/servicesScreen";
  static const addServicesScreen = "/addServicesScreen";
  static const orderListDetailsScreen = "/orderListDetailsScreen";
  static const orderDetailsPage = "/orderDetailsPage";
  static const serviceLocationScreen = "/serviceLocationScreen";
  static const selectedServiceLocationScreen = "/selectedServiceLocationScreen";
  static const walletScreen = "/walletScreen";
  static const mySlotsScreen = "/mySlotsScreen";
}

class AppPageRoutes {
  AppPageRoutes._();

  static const INITPage = _Path.Splash;
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () =>  LoginScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.signupScreen,
      page: () =>  SignupScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.signupScreenSetInformation,
      page: () =>  ExpertWorkerScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.profileSetting,
      page: () =>  ProfileSettingScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.homepage,
      page: () =>  HomepageScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.parentScreen,
      page: () =>  ParentScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.categoryList,
      page: () =>  CategoryViewAllList(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.servicesScreen,
      page: () =>  ServicesScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.addServicesScreen,
      page: () =>  AddServicesScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.orderListDetailsScreen,
      page: () =>  OrderListFullScreen(from: "homepage",),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.orderDetailsPage,
      page: () =>  OrderDetailsPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.serviceLocationScreen,
      page: () =>  ServiceLocationScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.selectedServiceLocationScreen,
      page: () =>  SelectedServiceLocationScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.walletScreen,
      page: () =>  WalletScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.mySlotsScreen,
      page: () =>  MySlotsScreen(),
      transition: Transition.cupertino,
    ),
  ];
}