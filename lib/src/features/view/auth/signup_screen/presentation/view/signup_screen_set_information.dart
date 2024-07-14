import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shebeauty_provider/src/core/utils/appColors.dart';
import 'package:shebeauty_provider/src/core/utils/extensions/extensions.dart';
import 'package:shebeauty_provider/src/features/view/auth/signup_screen/presentation/controller/signup_controller.dart';
import 'package:shebeauty_provider/src/features/widgets/common_appbar/common_appbar.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_text/custom_text.dart';

import '../../../../../../core/di/app_component.dart';
import '../../../../../../core/routes/AppRouts.dart';
import '../../../../../widgets/common_textField_widget/common_textfield_widget.dart';
import '../../../../../widgets/custom_elevatedButton/custom_eleveted_button.dart';

class SignupScreenSetInformation extends StatelessWidget {
  SignupScreenSetInformation({super.key});
  var controller = locator<SignupController>();
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      appBar: CommonCustomAppBar(
        appbarTitle: "Expert's worker",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: Container(
                      height: 74,
                      width: 74,
                      color: AppColors.deepGrey,
                    ),
                  ),
                  10.pw,
                  Expanded(
                    flex: 4,
                    child: CommonTextfieldWidget(
                        hintText: "Enter name",
                        controller: controller.workerNameController.value,
                        labelText: "Worker Name",
                        keyboardType: TextInputType.text),
                  ),
                ],
              ),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextfieldWidget(
                      hintText: "Enter mobile number",
                      controller: controller.mobileNumberController.value,
                      labelText: "Mobile Number",
                      keyboardType: TextInputType.number,
                    ),
                    20.ph,
                    CommonTextfieldWidget(
                      hintText: "Enter NID number",
                      controller: controller.nidNumberController.value,
                      labelText: "NID",
                      keyboardType: TextInputType.number,
                    ),
                    20.ph,
                    CommonTextfieldWidget(
                      hintText: "********",
                      controller: controller.experienceController.value,
                      labelText: "Experience Year",
                      keyboardType: TextInputType.number,
                      obscureText: controller.experienceYear.value,
                      icon: InkWell(
                          onTap: () {
                            controller.experienceYear.value =
                            !controller.experienceYear.value;
                          },
                          child: controller.experienceYear.value
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)),
                    ),
                    10.ph,
                  ],
                ),
              ),
              10.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 0,
                    child: CustomText(
                      text: "Gender",
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.15,
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(value: 1, groupValue: controller.gender.value, onChanged: (value){
                            controller.gender.value = value!;
                          }),
                          Icon(Icons.boy, size: 23,)
                        ],
                      ),
                      Row(
                        children: [
                          Radio(value: 2, groupValue: controller.gender.value, onChanged: (value){
                            controller.gender.value = value!;
                          }),
                          Icon(Icons.girl, size: 23,)
                        ],
                      ),
                    ],
                  )
                ],
              ),
              10.ph,

              CustomText(text: "Certificate Image", fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.15,),
              5.ph,
              Row(
                children: [
                  Expanded(child: CustomContainer()),
                  10.pw,
                  Expanded(child: CustomContainer()),
                  10.pw,
                  Expanded(child: CustomContainer()),
                  10.pw,
                  Expanded(child: CustomContainer()),
                  10.pw,
                  Expanded(child: CustomContainer()),
                ],
              ),
              40.ph,
              CustomElevatedButton(
                color: HexColor("D9D9D9"),
                onPress: () {
                  // Get.toNamed(AppRoutes.signupScreenSetInformation);
                },

                text: const CustomText(
                  text: "Submit",
                  textColor: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
  Widget CustomContainer(){
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColors.grey1.withOpacity(0.5),
          border: Border.all(color: AppColors.deepGrey, width: 1)
      ),
      child: Center(
        child: Icon(Icons.add_photo_alternate, size: 22,),
      ),
    );
  }
}
