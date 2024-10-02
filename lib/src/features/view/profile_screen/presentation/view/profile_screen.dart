import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty_provider/src/core/di/app_component.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/core/utils/app_assets.dart';
import 'package:shebeauty_provider/src/features/view/homepage/presentation/controller/homepage_controller.dart';
import 'package:shebeauty_provider/src/features/view/profile_screen/presentation/controller/profile_controller.dart';
import 'package:shebeauty_provider/src/features/view/service_location/presentation/controller/service_location_controller.dart';
import 'package:shebeauty_provider/src/features/view/services/presentation/controller/service_controller.dart';

import '../../../../../core/routes/AppRouts.dart';
import '../../../../../core/source/dio_client.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../widgets/common_cached_network_image/common_cached_network_image.dart';
import '../../../../widgets/custom_text/custom_text.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});
var serviceLocationController = locator<ServiceLocationController>(); 
var homeController = locator<HomepageController>();
var profileController = locator<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(
                    height: 75,
                    width: 74,
                    child: CommonCachedNetworkImage(
                      imageUrl:
                          "https://www.shutterstock.com/image-photo/smiling-mature-man-wearing-spectacles-260nw-1432699253.jpg",
                    ),
                  ),
                  15.pw,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Rohima Begom",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        letterSpacing: 0.25,
                      ),
                      const CustomText(
                        text: "RBegon@gmail.com",
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        letterSpacing: 0.25,
                      ),
                      const CustomText(
                        text: "+8801921334543",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        letterSpacing: 0.25,
                      ),
                    ],
                  ))
                ],
              ),
              10.ph,
              Divider(
                color: AppColors.deepGrey,
                thickness: 1,
              ),
              20.ph,
              CustomRow(icon: Icons.settings, menuName: "Add your services", onPress: (){
                Get.toNamed(AppRoutes.addServicesScreen);
                }),
              25.ph,
              CustomRow(icon: Icons.settings, menuName: "Profile Settings", onPress: (){Get.toNamed(AppRoutes.profileSetting);}),
              25.ph,
              CustomRow(icon: Icons.settings, menuName: "My Services", onPress: (){
                print("session.getToken ${session.getToken}");
                homeController.serviceProductFunction();
                profileController.storeProfileGetFunction();
                Get.toNamed(AppRoutes.servicesScreen);}),
              25.ph,
              // CustomRowImage(
              //     image: AppAssets.location, menuName: "My Time Slots", onPress: (){Get.toNamed(AppRoutes.mySlotsScreen);}),
              // 25.ph,
              CustomRowImage(
                  image: AppAssets.location, menuName: "Service Location", onPress: (){ serviceLocationController.saveAndNavigateIfNeeded();}),
              25.ph,
              CustomRow(icon: Icons.error, menuName: "Wallet", onPress: (){Get.toNamed(AppRoutes.walletScreen);}),
              25.ph,
              CustomRow(icon: Icons.error, menuName: "News"),
              25.ph,
              CustomRow(icon: Icons.local_police_sharp, menuName: "Policy"),
              25.ph,
              InkWell(
                  onTap: session.logout,
                  child: CustomRow(icon: Icons.logout_sharp, menuName: "Logout")),
              25.ph,
            ],
          ),
        ),
      ),
    );
  }

  Widget CustomRow({required IconData icon, required String menuName, VoidCallback? onPress}) {
    return InkWell(
      onTap: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.black,
          ),
          20.pw,
          Expanded(
              child: CustomText(
            text: menuName,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ))
        ],
      ),
    );
  }

  Widget CustomRowImage({required String image, required String menuName,VoidCallback? onPress}) {
    return InkWell(
      onTap: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            image,
            height: 20,
            width: 20,
            color: Colors.black,
          ),
          20.pw,
          Expanded(
              child: CustomText(
            text: menuName,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ))
        ],
      ),
    );
  }
}
