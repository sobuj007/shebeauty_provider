import 'package:shebeauty_provider/src/features/view/homepage/data/model/appointment_slot_model.dart';
import 'package:shebeauty_provider/src/features/view/homepage/data/model/experts_list_model.dart';
import 'package:shebeauty_provider/src/features/view/homepage/data/model/order_details_model.dart';
import 'package:shebeauty_provider/src/features/view/homepage/data/model/promotion_banner.dart';
import 'package:shebeauty_provider/src/features/view/homepage/data/model/service_list_model.dart';
import 'package:shebeauty_provider/src/features/view/homepage/data/model/time_slot_model.dart';

import '../../../../../core/source/model/api_response.dart';
import '../../data/model/all_order_model.dart';
import '../../data/model/get_all_product_model.dart';
import '../../data/model/review_model.dart';
import '../../data/source/get_all_product_service.dart';
import 'package:dio/dio.dart'as dio;
abstract class GetAllProductRepository {
  final GetAllProductService getAllProductService;

  GetAllProductRepository(this.getAllProductService);

  Future<Response<GetAllProductModel?>?> getAllProductPass();
  Future<Response<ServiceModel?>?> serviceProduct();
  Future<Response<ExpertsListModel?>?> expertsList();
  Future<Response<TimeSlotModel?>?> timeSlot();
  Future<Response<AppointmentSlotModel?>?> appointmentTimeSlot({required String id});
  Future<Response<OrderDetailsModel?>?> ordersDetailsPass({required String id});
  Future<Response<List<AllOrdersModel>>?> getAllOrderList();
  Future<Response<PromotionBannerModel>?> promotionBanner();
  Future<Response<ReviewModel>?> review();
}
