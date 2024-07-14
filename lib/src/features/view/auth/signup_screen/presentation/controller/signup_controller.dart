import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController{
  var emailController = TextEditingController().obs;
  var companyNameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var confirmPasswordController = TextEditingController().obs;
  var workerNameController = TextEditingController().obs;
  var mobileNumberController = TextEditingController().obs;
  var nidNumberController = TextEditingController().obs;
  var experienceController = TextEditingController().obs;
  var passwordVisibility = true.obs;
  var confirmPasswordVisibility = true.obs;
  var termConditions = false.obs;
  var experienceYear = false.obs;
  var gender = 0.obs;
}