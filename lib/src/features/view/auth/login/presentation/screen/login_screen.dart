import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/core/source/dio_client.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_text/custom_text.dart';
import '../../../../../../core/di/app_component.dart';
import '../../../../../../core/routes/AppRouts.dart';
import '../../../../../widgets/common_textField_widget/common_textfield_widget.dart';
import '../../../../../widgets/custom_elevatedButton/custom_eleveted_button.dart';
import '../../../../../widgets/custom_richtext/custom_richtext.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var controller = locator<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CommonTextfieldWidget(
                        hintText: "example@gmail.com",
                          obscureText: controller.emailVisibility.value,
                          controller: controller.emailController.value,
                          labelText: "Email",
                          // icon: InkWell(
                          //   onTap: () {
                          //     controller.emailVisibility.value =
                          //         !controller.emailVisibility.value;
                          //   },
                          //   child: controller.emailVisibility.value
                          //       ? const Icon(Icons.visibility_off)
                          //       : const Icon(Icons.visibility),
                          // ),
                          keyboardType: TextInputType.emailAddress),
                      20.ph,
                      CommonTextfieldWidget(
                        hintText: "************",
                        obscureText: controller.passwordVisibility.value,
                        controller: controller.passwordController.value,
                        labelText: "Password",
                        keyboardType: TextInputType.visiblePassword,
                        icon: InkWell(
                            onTap: () {
                              controller.passwordVisibility.value =
                                  !controller.passwordVisibility.value;
                            },
                            child: controller.passwordVisibility.value
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility)),
                      ),
                      20.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: controller.rememberMe.value,
                                onChanged: (value) {
                                  controller.rememberMe.value = value!;
                                  session.setRememberMe = value;
                                },
                              ),
                              const CustomText(text: "Remember Me")
                            ],
                          ),
                          const CustomText(text: "Forget Password?")
                        ],
                      ),
                      10.ph,
                      CustomElevatedButton(
                        color: HexColor("D9D9D9"),
                        onPress: () {
                          controller.submitLoginData(context);

                        },
                        // RouteGenerator.pushNamed(context, Routes.mortgageResultPage);
                        text: controller.isLoading.value == true ? const Center(
                          child: CircularProgressIndicator(),
                        ) : const CustomText(
                          text: "Login",
                          textColor: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){

                    Get.toNamed(AppRoutes.signupScreen);
                  },
                  child: const CustomRichText(
                    heading: "Don't have account",
                    title: 'Signup!',
                    titleTextColor: Colors.black,
                    headingTextColor: Colors.black,
                    headingFontSize: 13.0,
                    titleFontSIze: 16.0,
                    headingFontWeight: FontWeight.w400,
                    titleFontWeight: FontWeight.w700,
                  ),
                ),
                20.ph,
              ],
            ),
          )),
    );
  }
}
