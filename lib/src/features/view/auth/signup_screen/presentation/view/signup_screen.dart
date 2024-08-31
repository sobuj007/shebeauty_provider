import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/features/view/auth/signup_screen/presentation/controller/signup_controller.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_text/custom_text.dart';
import '../../../../../../core/di/app_component.dart';
import '../../../../../../core/routes/AppRouts.dart';
import '../../../../../widgets/common_textField_widget/common_textfield_widget.dart';
import '../../../../../widgets/custom_elevatedButton/custom_eleveted_button.dart';
import '../../../../../widgets/custom_richtext/custom_richtext.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  var controller = locator<SignupController>();
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
                    hintText: "Enter company name",
                      controller: controller.companyNameController.value,
                      labelText: "Company Name",
                      keyboardType: TextInputType.text,
                    obscureText: false,
                  ),
                  20.ph,
                  CommonTextfieldWidget(
                    hintText: "example@gmail.com",
                      controller: controller.emailController.value,
                      labelText: "Email",
                      keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  ),
                  20.ph,
                  CommonTextfieldWidget(
                    hintText: "*********",
                    obscureText: controller.passwordVisibility.value,
                    controller: controller.passwordController.value,
                    labelText: "Password",
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
                  CommonTextfieldWidget(
                    hintText: "**********",
                    obscureText: controller.confirmPasswordVisibility.value,
                    controller: controller.confirmPasswordController.value,
                    labelText: "Confirm Password",
                    icon: InkWell(
                        onTap: () {
                          controller.confirmPasswordVisibility.value =
                          !controller.confirmPasswordVisibility.value;
                        },
                        child: controller.confirmPasswordVisibility.value
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
                            value: controller.termConditions.value,
                            onChanged: (value) {
                              controller.termConditions.value = value!;
                            },
                          ),
                          const CustomText(text: "Terms and Condition")
                        ],
                      ),
                    ],
                  ),
                  10.ph,
                  CustomElevatedButton(
                    color: HexColor("D9D9D9"),
                    onPress: () {
                      controller.submitSignupData(context);
                      // Get.toNamed(AppRoutes.signupScreenSetInformation);
                    },

                    text: const CustomText(
                      text: "Register",
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
                Get.offAllNamed(AppRoutes.loginScreen);
              },
              child: const CustomRichText(
                heading: "Have account",
                title: 'Login!',
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
