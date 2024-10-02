
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
import '../model/store_profile_get.dart';
import '../model/store_profile_model.dart';
import 'package:dio/dio.dart' as dio;
var session = locator<SessionManager>();

class StoreProfileService {
  final DioClient _dioClient = locator<DioClient>();

  Future<Response<StoreProfileModel>?> servicePass(Map<String, Object> data) async {
    Response<StoreProfileModel>? apiResponse;
   await _dioClient.post(
      path: NetworkConfiguration.storeProfile,
      request: data,
      responseCallback: (response, message) {
          var registrationModel = StoreProfileModel.fromJson(response);
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
  Future<Response<StoreProfileGetModel>?> storeProfileGet() async {
    Response<StoreProfileGetModel>? apiResponse;
   await _dioClient.get(
      path: "${NetworkConfiguration.storeProfileGet}${session.getId}/getagent",
      responseCallback: (response, message) {
          var registrationModel = StoreProfileGetModel.fromJson(response);
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
