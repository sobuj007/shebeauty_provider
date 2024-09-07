import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/di/app_component.dart';
import '../../../../../../core/routes/AppRouts.dart';
import '../../../../../../core/source/dio_client.dart';
import '../../../../../widgets/custom_toast/custom_toast.dart';
import '../../domain/repository/reg_repository.dart';
import '../../domain/usecase/reg_pass_usecase.dart';

class SignupController extends GetxController{
  var emailController = TextEditingController().obs;
  var companyNameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var confirmPasswordController = TextEditingController().obs;

  var passwordVisibility = true.obs;
  var confirmPasswordVisibility = true.obs;
  var termConditions = false.obs;

  var isLoading = false.obs;



  submitSignupData(BuildContext context) async {
    if(companyNameController.value.text.isEmpty){
      errorToast(context: context, msg: "Please enter company name.");
    }else if(emailController.value.text.isEmpty){
      errorToast(context: context, msg: "Please enter email address.");
    }else if(passwordController.value.text.isEmpty){
      errorToast(context: context, msg: "Please enter password.");
    }else if(confirmPasswordController.value.text.isEmpty){
      errorToast(context: context, msg: "Please enter confirmation password.");
    }else if(termConditions.value == false){
      errorToast(context: context, msg: "Please select terms and condition.");
    }else if(passwordController.value.text != confirmPasswordController.value.text){
      errorToast(context: context, msg: "Password is not matched. Both password will be same.");
    }else{
      try {
        isLoading.value = true;
        RegPassUseCase signUpPassUseCase =
        RegPassUseCase(locator<RegRepository>());
        var formData = {
          "name": companyNameController.value.text,
          "email": emailController.value.text,
          "role": "agent",
          "password": passwordController.value.text,
          "agent" : "agent",
          "password_confirmation": confirmPasswordController.value.text,
        };
        var response = await signUpPassUseCase(formData);
        if (response?.data != null && response?.data?.message == "Registration successful"){
          print("this is not here");
          successToast(context: context, msg: "Successfully sign up");
          Get.offNamed(AppRoutes.loginScreen);
        }else{
          print("this is value");
        }
      } catch (e) {
        print(e.toString());
        errorToast(context: context, msg: "The email has already been taken.");
      }finally{
        isLoading.value = false;
      }
    }
  }




}