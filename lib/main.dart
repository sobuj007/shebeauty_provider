import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty_provider/src/core/di/app_component.dart';
import 'package:shebeauty_provider/src/core/routes/AppRouts.dart';
import 'package:sizer/sizer.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const SheBeauty());
}

class SheBeauty extends StatelessWidget {
  const SheBeauty({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, oriantation, screenType) => GetMaterialApp(
        title: "SheBeauty",
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splash,
        getPages: AppPageRoutes.routes,
      ),
    );
  }
}
