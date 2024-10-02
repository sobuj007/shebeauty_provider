import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../core/di/app_component.dart';
import '../../../../../../core/routes/AppRouts.dart';
import '../../../../../../core/source/dio_client.dart';
import '../../../../../widgets/custom_toast/custom_toast.dart';
import '../../data/model/login_model.dart';
import '../../domain/repository/login_repository.dart';
import '../../domain/usecase/login_with_id_pass_usecase.dart';

class LoginController extends GetxController{
  var emailController = TextEditingController(text: "agent@gmail.com").obs;
  var passwordController = TextEditingController(text: "password").obs;
  var emailVisibility = false.obs;
  var passwordVisibility = true.obs;
  var confirmPasswordVisibility = false.obs;
  var rememberMe = false.obs;
  var isLoading = false.obs;
  var loginModel = LoginModel().obs;
  submitLoginData(BuildContext context) async {
    print("this is h");
    try {
      LoginWithIdPassUseCase loginUseCase =
      LoginWithIdPassUseCase(locator<SignInRepository>());
      if (emailController.value.text.isEmpty && (session.getEmail?.isEmpty ?? false)) {
        errorToast(context: context, msg: "Please enter email");
      } else if (passwordController.value.text.isEmpty && (session.getPassword?.isEmpty ?? false)) {
        errorToast(context: context, msg: "Please enter password");
      }  else {
        isLoading.value = true;
        update();
        var response = await loginUseCase(
            userName: session.getEmail ?? emailController.value.text,
            password: session.getPassword ?? passwordController.value.text);
        print("this is data of login ${response?.data?.token}");
        if (response?.data != null) {
          loginModel.value = response?.data ?? LoginModel() ;
          if(session.getRememberMe == true){
            session.createSession(response?.data,
                email: emailController.value.text,
                password: passwordController.value.text);
          }else{
            session.setToken = response?.data?.token ?? '';
          }
          print("this is token ${session.getToken} ${loginModel.value.user?.name}");
          if (!context.mounted) return;
          Get.offNamed(AppRoutes.parentScreen);
          // Get.offNamed(AppRoutes.signupScreenSetInformation);
          if (!context.mounted) return;
          if((session.getEmail?.isEmpty ?? false) && (session.getPassword?.isEmpty ?? false)){
            successToast(context: context, msg: "Successfully sign in");
          }
        } else {
          if (!context.mounted) return;
          if (response?.data?.token == null) {
            errorToast(context: context, msg: "Invalid login credential!");
          }
        }
      }
    } catch (e) {
      print(e.toString() ?? '');
    } finally {
      isLoading.value = false;
    }
    update();
  }
}