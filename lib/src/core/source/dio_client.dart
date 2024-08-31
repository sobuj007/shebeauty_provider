import 'dart:core';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shebeauty_provider/src/core/source/session_manager.dart';
import '../di/app_component.dart';
import '../network/configuration.dart';
import '../utils/common_methods.dart';
import '../utils/constants.dart';

var session = locator<SessionManager>();
class DioClient {
  final Dio dio;

  DioClient(this.dio);

  Future<Response?> post({
    required String path,
    dynamic request,
    required Function(dynamic, String?) responseCallback,
    required Function(String?, int?) failureCallback,
    dynamic header,
  }) async {
    Response? response;
    var connectivityResult = await (Connectivity().checkConnectivity());
    // try {
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        print(request.toString());
        response = await dio.post(
          (NetworkConfiguration.baseUrl) + path,
          data: request,
          // queryParameters: request,
          options: Options(
            method: "POST",
            headers: {
              'Authorization': 'Bearer ${session.getToken}',
              'Accept': 'application/json'
            },
            receiveTimeout: const Duration(milliseconds: 30000),

          ),
        );
    // var csrftoken = response.headers.remove('set-cookie').substring(10, 74);
        if (response.data != null) {
          logger.i("dio response $response");
          logger.i("dio response111 ${response.data}");

          responseCallback(response.data, response.statusMessage);
        } else {
          failureCallback(response.statusMessage, response.statusCode);
        }
      } else {
        CommonMethods.showToast(Constants.MESSAGE_NO_INTERNET, Colors.white);
      }
    // } catch (e) {
    //   // logger.d(e.toString());
    //   failureCallback("Something went wrong!", 400);
    // }
    return response;
  }

  Future<Response?> postMultiplatFormData({
    required String path,
    dynamic request,
    required Function(dynamic, String?) responseCallback,
    required Function(String?, int?) failureCallback, bool? isNeedToken,
    dynamic header,
  }) async {
    Response? response;
    var connectivityResult = await (Connectivity().checkConnectivity());
    try {

      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        response = await dio.post(
          NetworkConfiguration.baseUrl + path,
          data: request,
          options: Options(
            headers: {
              'Accept': '*',
              'Authorization': 'Bearer ${session.getToken}',
            },
            method: "POST",
            receiveTimeout: const Duration(milliseconds: 30000),
          ),
        );

        if (response.data != null) {
          logger.i("dio response $response");
          responseCallback(response.data, response.statusMessage);
        } else {
          failureCallback(response.statusMessage, response.statusCode);
        }
      } else {
        CommonMethods.showToast(Constants.MESSAGE_NO_INTERNET, Colors.white);
      }
    } catch (e) {
      // logger.d(e.toString());
      failureCallback("Something went wrong!", 400);
    }
    return response;
  }

  // Future<Response?> postUpload({
  //   required String path,
  //   dynamic request,
  //   required Function(dynamic) responseCallback,
  //   required Function(String?, int?) failureCallback,
  //   dynamic header,
  // }) async {
  //   Response? response;
  //   var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  //   var formData = FormData.fromMap({
  //     'Image': '${request["Image"]}',
  //     'status': '${request["status"]}', //'101075',
  //     'Company': '${request["Company"]}',
  //     'DocumentType': '${request["DocumentType"]}'
  //   });
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   try {
  //     if (connectivityResult == ConnectivityResult.mobile ||
  //         connectivityResult == ConnectivityResult.wifi) {
  //       response = await dio.post(
  //           'https://corporate3.bdjobs.com/api/v1/Uddokta/DocumentUpload.aspx',
  //           data: formData,
  //           options: Options(headers: headers));
  //
  //       if (response.data != null && response.statusCode == HttpStatus.ok ||
  //           response.statusCode == 200) {
  //         responseCallback(response.data);
  //       } else {
  //         failureCallback(response.statusMessage, response.statusCode);
  //       }
  //     } else if (connectivityResult == ConnectivityResult.none) {
  //       failureCallback(noInternetConnectionMessage, 12029);
  //     }
  //   } catch (e) {
  //     logger.e("Response code: ${response?.statusCode}");
  //     logger.e(e);
  //     failureCallback(tryAgainErrorMessage, 400);
  //   }
  //   return response;
  // }

  Future<Response?> get({
    required String path,
    required Function(dynamic, String?) responseCallback,
    required Function(String?, int?) failureCallback,
    Map<String, Object>? queryParameters,  bool? isNeedToken,
  }) async {
    Response? response;
    var connectivityResult = await (Connectivity().checkConnectivity());
    print("the url is ${NetworkConfiguration.baseUrl + path}");
    try {
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        response = await dio.get(
          NetworkConfiguration.baseUrl + path,
          queryParameters: queryParameters,
          options: Options(
            headers: {
              'Accept': '*',
              'Authorization': 'Bearer ${session.getToken}',
            },
            method: "GET",
            receiveTimeout: const Duration(milliseconds: 3000),
          ),
        );
        print("response.dataASDasdASDasds ${session.getToken}");
        print("response.dataASDasdASDasds ${response.data}");
        if (response.data != null) {
          logger.i("dio response $response");
          responseCallback(response.data, response.statusMessage);
        } else {
          failureCallback(response.statusMessage, response.statusCode);
        }
      } else if (connectivityResult.contains(ConnectivityResult.none)) {
        // failureCallback(noInternetConnectionMessage, 12029);
      }
    } on Exception catch (e, _) {
      // failureCallback(tryAgainErrorMessage, 400);
    }
    return response;
  }
}
