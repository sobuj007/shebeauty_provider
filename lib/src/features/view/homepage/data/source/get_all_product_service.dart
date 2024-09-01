
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shebeauty_provider/src/features/view/homepage/data/model/all_order_model.dart';
import 'package:shebeauty_provider/src/features/view/homepage/data/model/order_details_model.dart';

import '../../../../../../../main.dart';
import '../../../../../core/di/app_component.dart';
import '../../../../../core/network/configuration.dart';
import '../../../../../core/source/dio_client.dart';
import '../../../../../core/source/model/api_response.dart';
import '../../../../../core/source/session_manager.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../widgets/custom_toast/custom_toast.dart';
import '../model/get_all_product_model.dart';
import 'package:dio/dio.dart' as dio;
var session = locator<SessionManager>();

class GetAllProductService {
  final DioClient _dioClient = locator<DioClient>();

  Future<Response<GetAllProductModel>?> getAllProductPass() async {
    Response<GetAllProductModel>? apiResponse;
   await _dioClient.get(
      path: NetworkConfiguration.getAll,
      responseCallback: (response, message) {
          var registrationModel = GetAllProductModel.fromJson(response);
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
  Future<Response<List<AllOrdersModel>>?> getAllOrderList() async {
    Response<List<AllOrdersModel>>? apiResponse;
   await _dioClient.get(
      path: NetworkConfiguration.orders,
      responseCallback: (response, message) {
        // Handle successful response
        print("this is product");

        // Check if the response is a List
        if (response is List) {
          // Convert the list of dynamic to a list of ProductCategoryModel
          List<AllOrdersModel> allOrders = response
              .map((item) => AllOrdersModel.fromJson(item as Map<String, dynamic>))
              .toList();
          apiResponse = Response.success(allOrders);
        } else {
          // Handle the case where the response is not a list (optional)
          apiResponse = Response.error("Unexpected response format", null);
        }
      },
      failureCallback: (message, status) {
        print("this is message error $message $status");
        apiResponse = Response.error(message, status);
      },
    );


    logger.e("api response ${apiResponse?.data}");
    return apiResponse;
  }
  Future<Response<OrderDetailsModel>?> orderDetailsPass({required String id}) async {
    Response<OrderDetailsModel>? apiResponse;
    await _dioClient.get(
      path: NetworkConfiguration.orders + "/$id" + "/show",
      responseCallback: (response, message) {
        var registrationModel = OrderDetailsModel.fromJson(response);
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
