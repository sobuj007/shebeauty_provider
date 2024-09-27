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
import 'get_all_product_usecase.dart';

class GetAllProductPassUseCase extends GetAllProductUseCase {
  GetAllProductPassUseCase(super.getAllProductRepository);

  Future<Response<GetAllProductModel?>?> call() async {
    var response = await getAllProductRepository.getAllProductPass();
    return response;
  }
}

class ServiceProductsPassUseCase extends ServiceProductsUseCase {
  ServiceProductsPassUseCase(super.getAllProductRepository);

  Future<Response<ServiceModel?>?> call() async {
    var response = await getAllProductRepository.serviceProduct();
    return response;
  }
}

class ExpertsListPassUseCase extends ExpertsListUseCase {
  ExpertsListPassUseCase(super.getAllProductRepository);

  Future<Response<ExpertsListModel?>?> call() async {
    var response = await getAllProductRepository.expertsList();
    return response;
  }
}

class TimeSlotPassUseCase extends TimeSlotUseCase {
  TimeSlotPassUseCase(super.getAllProductRepository);

  Future<Response<TimeSlotModel?>?> call() async {
    var response = await getAllProductRepository.timeSlot();
    return response;
  }
}

class GetOrdersPassUseCase extends GetOrdersProductUseCase {
  GetOrdersPassUseCase(super.getAllProductRepository);

  Future<Response<List<AllOrdersModel>>?> call() async {
    var response = await getAllProductRepository.getAllOrderList();
    return response;
  }
}

class OrderDetailsPassUseCase extends OrderDetailsUseCase {
  OrderDetailsPassUseCase(super.getAllProductRepository);

  Future<Response<OrderDetailsModel?>?> call({required String id}) async {
    var response = await getAllProductRepository.ordersDetailsPass(id: id);
    return response;
  }
}

class AppointmentSlotPassUseCase extends AppointmentSlotUseCase {
  AppointmentSlotPassUseCase(super.getAllProductRepository);

  Future<Response<AppointmentSlotModel?>?> call({required String id}) async {
    var response = await getAllProductRepository.appointmentTimeSlot(id: id);
    return response;
  }
}

class PromotionBannerPassUseCase extends PromotionBannerUseCase {
  PromotionBannerPassUseCase(super.getAllProductRepository);

  Future<Response<PromotionBannerModel?>?> call() async {
    var response = await getAllProductRepository.promotionBanner();
    return response;
  }
}

class ReviewPassUseCase extends ReviewUseCase {
  ReviewPassUseCase(super.getAllProductRepository);

  Future<Response<ReviewModel?>?> call() async {
    var response = await getAllProductRepository.review();
    return response;
  }
}
