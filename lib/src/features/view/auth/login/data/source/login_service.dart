import '../../../../../../core/di/app_component.dart';
import '../../../../../../core/network/configuration.dart';
import '../../../../../../core/source/dio_client.dart';
import '../../../../../../core/source/model/api_response.dart';
import '../../../../../../core/source/session_manager.dart';
import '../../../../../../core/utils/constants.dart';
import '../model/login_model.dart';
var session = locator<SessionManager>();

class SignInService {
  final DioClient _dioClient = locator<DioClient>();

  Future<Response<LoginModel>?> loginWithIdPass(
      String id, String password) async {
    Response<LoginModel>? apiResponse;

    var formData = {
      "email": id,
      "password": password,
    };
    print("data $formData");
   await _dioClient.post(
      path: NetworkConfiguration.login,
      request: formData,
      responseCallback: (response, message) {
        var loginModel = LoginModel.fromJson(response);
        // Create a Response object with the parsed data
        apiResponse = Response.success(loginModel);
        logger.i("Login successful: $loginModel");
      },
      failureCallback: (message, status) {
        apiResponse = Response.error(message, status);
      },
    );


    logger.e("api response ${apiResponse?.data}");
    return apiResponse;
  }

}
