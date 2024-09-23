import 'package:shebeauty_provider/src/core/source/model/api_response.dart';
import 'package:shebeauty_provider/src/features/view/homepage/data/model/appointment_slot_model.dart';
import 'package:shebeauty_provider/src/features/view/homepage/data/model/experts_list_model.dart';
import 'package:shebeauty_provider/src/features/view/homepage/data/model/service_list_model.dart';
import 'package:shebeauty_provider/src/features/view/homepage/data/model/time_slot_model.dart';

import '../../domain/repository/get_all_product_repository.dart';
import '../model/all_order_model.dart';
import '../model/get_all_product_model.dart';
import 'package:dio/dio.dart' as dio;
import '../model/order_details_model.dart';
import '../model/promotion_banner.dart';
import '../model/review_model.dart';
import '../source/get_all_product_service.dart';

class GetAllProductRepositoryImpl extends GetAllProductRepository {
  GetAllProductRepositoryImpl(super.getAllProductService);

  @override
  Future<Response<GetAllProductModel?>?> getAllProductPass() async {
    Response<GetAllProductModel>? apiResponse;
    apiResponse = await getAllProductService.getAllProductPass();
    return apiResponse;
  }

  @override
  Future<Response<ServiceModel?>?> serviceProduct() async {
    Response<ServiceModel>? apiResponse;
    apiResponse = await getAllProductService.serviceProduct();
    return apiResponse;
  }

  @override
  Future<Response<ExpertsListModel?>?> expertsList() async {
    Response<ExpertsListModel>? apiResponse;
    apiResponse = await getAllProductService.expertsList();
    return apiResponse;
  }

  @override
  Future<Response<TimeSlotModel?>?> timeSlot() async {
    Response<TimeSlotModel>? apiResponse;
    apiResponse = await getAllProductService.timeSlot();
    return apiResponse;
  }

  @override
  Future<Response<AppointmentSlotModel?>?> appointmentTimeSlot({required String id}) async {
    Response<AppointmentSlotModel>? apiResponse;
    apiResponse = await getAllProductService.appointmentTimeSlot(id: id);
    return apiResponse;
  }

  @override
  Future<Response<List<AllOrdersModel>>?> getAllOrderList() async {
    Response<List<AllOrdersModel>>? apiResponse;
    apiResponse = await getAllProductService.getAllOrderList();
    return apiResponse;
  }

  @override
  Future<Response<OrderDetailsModel?>?> ordersDetailsPass(
      {required String id}) async {
    Response<OrderDetailsModel>? apiResponse;
    apiResponse = await getAllProductService.orderDetailsPass(id: id);
    return apiResponse;
  }
  @override
  Future<Response<PromotionBannerModel>?> promotionBanner() async {
    Response<PromotionBannerModel>? apiResponse;
    apiResponse = await getAllProductService.promotionBanner();
    return apiResponse;
  }
  @override
  Future<Response<ReviewModel>?> review() async {
    Response<ReviewModel>? apiResponse;
    apiResponse = await getAllProductService.review();
    return apiResponse;
  }
}
