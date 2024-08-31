
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../../../main.dart';
import '../../../../../core/di/app_component.dart';
import '../../../../../core/network/configuration.dart';
import '../../../../../core/source/dio_client.dart';
import '../../../../../core/source/model/api_response.dart';
import '../../../../../core/source/session_manager.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../widgets/custom_toast/custom_toast.dart';
import '../model/experts_create_model.dart';
import 'package:dio/dio.dart' as dio;
var session = locator<SessionManager>();

class ExpartCreateService {
  final DioClient _dioClient = locator<DioClient>();

  Future<Response<ExpertsCreateModel>?> expertsPass(dio.FormData data) async {
    Response<ExpertsCreateModel>? apiResponse;
    print(data.fields.first.value);
   await _dioClient.post(
      path: NetworkConfiguration.createExperts,
      request: data,
      responseCallback: (response, message) {
          var registrationModel = ExpertsCreateModel.fromJson(response);
          apiResponse = Response.success(registrationModel);
      },
      failureCallback: (message, status) {
        print("this is message error $message $status");
        apiResponse = Response.error(message, status);
      },
    );


    logger.e("api response ${apiResponse?.data}");
    return apiResponse;
  }
}
