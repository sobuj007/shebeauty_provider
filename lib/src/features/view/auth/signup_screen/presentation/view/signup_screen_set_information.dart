import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/features/view/auth/signup_screen/presentation/controller/signup_controller.dart';
import 'package:shebeauty_provider/src/features/widgets/common_appbar/common_appbar.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_text/custom_text.dart';
import '../../../../../../core/di/app_component.dart';
import '../../../../../../core/routes/AppRouts.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../widgets/common_cached_network_image/common_cached_network_image.dart';
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
        onTap: (){
          Get.toNamed(AppRoutes.profile);
        }
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
                  SizedBox(
                    height: 75,
                    width: 74,
                    child: CommonCachedNetworkImage(imageUrl: "https://www.shutterstock.com/image-photo/smiling-mature-man-wearing-spectacles-260nw-1432699253.jpg",)
                  ),
                  10.pw,
                  Expanded(
                    flex: 5,
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
              // Row(
              //   children: [
              //     Expanded(child: CustomContainer()),
              //     10.pw,
              //     Expanded(child: CustomContainer()),
              //     10.pw,
              //     Expanded(child: CustomContainer()),
              //     10.pw,
              //     Expanded(child: CustomContainer()),
              //     10.pw,
              //     Expanded(child: CustomContainer()),
              //   ],
              // ),

              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  ...List.generate(controller.images.length, (index) {
                    return GestureDetector(
                      onTap: () => controller.showPicker(context, index),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColors.buttonColor.withOpacity(0.5),
                              border: Border.all(color: AppColors.buttonColor, width: 1)
                          ),
                          width: (MediaQuery.of(context).size.width / 5) - 16,
                          height: 60,
                          child: controller.images[index] != null
                              ? Image.file(controller.images[index]!, fit: BoxFit.cover)
                              : Center(
                            child: Icon(Icons.add_photo_alternate, size: 22,),
                          )
                      ),
                    );
                  }),
                  GestureDetector(
                    onTap: controller.addContainer,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.buttonColor.withOpacity(0.5),
                          border: Border.all(color: AppColors.buttonColor, width: 1)
                      ),
                      width: (MediaQuery.of(context).size.width / 5) - 16,
                      height: 60,
                      child: Icon(Icons.add, color: Colors.black, size: 30),
                    ),
                  ),
                ]
              ),
              40.ph,
              CustomElevatedButton(
                color: HexColor("D9D9D9"),
                onPress: () {
                  Get.toNamed(AppRoutes.parentScreen);
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
          color: AppColors.buttonColor.withOpacity(0.5),
          border: Border.all(color: AppColors.buttonColor, width: 1)
      ),
      child: Center(
        child: Icon(Icons.add_photo_alternate, size: 22,),
      ),
    );
  }
}
