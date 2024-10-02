import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shebeauty_provider/src/features/view/homepage/data/model/all_order_model.dart';
import 'package:shebeauty_provider/src/features/view/homepage/data/model/appointment_slot_model.dart';
import 'package:shebeauty_provider/src/features/view/homepage/data/model/experts_list_model.dart';
import 'package:shebeauty_provider/src/features/view/homepage/data/model/order_details_model.dart';
import 'package:shebeauty_provider/src/features/view/homepage/data/model/promotion_banner.dart';
import 'package:shebeauty_provider/src/features/view/homepage/data/model/service_list_model.dart';
import 'package:shebeauty_provider/src/features/view/homepage/data/model/time_slot_model.dart';

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

import '../model/review_model.dart';

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
        print("this is productssssssss");

        // Check if the response is a List
        if (response is List) {
          // Convert the list of dynamic to a list of ProductCategoryModel
          List<AllOrdersModel> allOrders = response
              .map((item) =>
                  AllOrdersModel.fromJson(item as Map<String, dynamic>))
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

  Future<Response<OrderDetailsModel>?> orderDetailsPass(
      {required String id}) async {
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

  Future<Response<ServiceModel>?> serviceProduct() async {
    Response<ServiceModel>? apiResponse;
    await _dioClient.get(
      path: NetworkConfiguration.serviceList,
      responseCallback: (response, message) {
        var registrationModel = ServiceModel.fromJson(response);
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

  Future<Response<ExpertsListModel>?> expertsList() async {
    Response<ExpertsListModel>? apiResponse;
    await _dioClient.get(
      path: NetworkConfiguration.expertsList,
      responseCallback: (response, message) {
        var registrationModel = ExpertsListModel.fromJson(response);
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

  Future<Response<TimeSlotModel>?> timeSlot() async {
    Response<TimeSlotModel>? apiResponse;
    await _dioClient.get(
      path: NetworkConfiguration.timeSlot,
      responseCallback: (response, message) {
        var registrationModel = TimeSlotModel.fromJson(response);
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
  Future<Response<AppointmentSlotModel>?> appointmentTimeSlot({required String id}) async {
    Response<AppointmentSlotModel>? apiResponse;
    await _dioClient.get(
      path: "${NetworkConfiguration.appointmentSlotShow}$id",
      responseCallback: (response, message) {
        var registrationModel = AppointmentSlotModel.fromJson(response);
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
  Future<Response<PromotionBannerModel>?> promotionBanner() async {
    Response<PromotionBannerModel>? apiResponse;
    await _dioClient.get(
      path: NetworkConfiguration.promotionBanner,
      responseCallback: (response, message) {
        var registrationModel = PromotionBannerModel.fromJson(response);
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
  Future<Response<ReviewModel>?> review() async {
    Response<ReviewModel>? apiResponse;
    print("session.getId ${session.getId}");
    await _dioClient.get(
      path: "${NetworkConfiguration.review}${session.getId}",
      responseCallback: (response, message) {
        var reviewModel = ReviewModel.fromJson(response);
        apiResponse = Response.success(reviewModel);
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
