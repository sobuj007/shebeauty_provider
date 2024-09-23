import '../repository/get_all_product_repository.dart';

abstract class GetAllProductUseCase {
  final GetAllProductRepository getAllProductRepository;

  GetAllProductUseCase(this.getAllProductRepository);
}

abstract class ServiceProductsUseCase {
  final GetAllProductRepository getAllProductRepository;

  ServiceProductsUseCase(this.getAllProductRepository);
}

abstract class ExpertsListUseCase {
  final GetAllProductRepository getAllProductRepository;

  ExpertsListUseCase(this.getAllProductRepository);
}

abstract class TimeSlotUseCase {
  final GetAllProductRepository getAllProductRepository;

  TimeSlotUseCase(this.getAllProductRepository);
}

abstract class OrderDetailsUseCase {
  final GetAllProductRepository getAllProductRepository;

  OrderDetailsUseCase(this.getAllProductRepository);
}

abstract class GetOrdersProductUseCase {
  final GetAllProductRepository getAllProductRepository;

  GetOrdersProductUseCase(this.getAllProductRepository);
}

abstract class AppointmentSlotUseCase {
  final GetAllProductRepository getAllProductRepository;

  AppointmentSlotUseCase(this.getAllProductRepository);
}

abstract class PromotionBannerUseCase {
  final GetAllProductRepository getAllProductRepository;

  PromotionBannerUseCase(this.getAllProductRepository);
}

abstract class ReviewUseCase {
  final GetAllProductRepository getAllProductRepository;

  ReviewUseCase(this.getAllProductRepository);
}
