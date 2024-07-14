import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  var emailController = TextEditingController().obs;
  var emailVisibility = false.obs;
  var passwordVisibility = false.obs;
  var confirmPasswordVisibility = false.obs;
  var rememberMe = false.obs;
}