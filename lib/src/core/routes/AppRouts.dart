import 'package:get/get.dart';
import 'package:shebeauty_provider/src/features/view/homepage/presentation/view/screen/homepage.dart';
import 'package:shebeauty_provider/src/features/view/profile_screen/presentation/view/profile_screen.dart';
import '../../features/view/auth/login/screen/login_screen.dart';
import '../../features/view/auth/signup_screen/presentation/view/signup_screen.dart';
import '../../features/view/auth/signup_screen/presentation/view/signup_screen_set_information.dart';
import '../../features/view/homepage/presentation/view/screen/category_view_all_list.dart';
import '../../features/view/homepage/presentation/view/screen/services_screen.dart';
import '../../features/view/parent_page/parent_screen.dart';
import '../../features/view/splash_screen/splash_screen.dart';

abstract class AppRoutes {
  AppRoutes._();
  static const splash = _Path.Splash;
  static const loginScreen = _Path.login;
  static const signupScreen = _Path.signup;
  static const signupScreenSetInformation = _Path.signupScreenSetInformation;
  static const profile = _Path.profile;
  static const homepage = _Path.homepage;
  static const parentScreen = _Path.parentScreen;
  static const categoryList = _Path.categoryList;
  static const servicesScreen = _Path.servicesScreen;
}

abstract class _Path {
  _Path._();

  static const Splash = "/splash";
  static const login = "/login";
  static const signup = "/signup";
  static const signupScreenSetInformation = "/signupScreenSetInformation";
  static const profile = "/profile";
  static const homepage = "/homepage";
  static const parentScreen = "/parentScreen";
  static const categoryList = "/categoryList";
  static const servicesScreen = "/servicesScreen";
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
      page: () =>  SignupScreenSetInformation(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () =>  ProfileScreen(),
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
  ];
}