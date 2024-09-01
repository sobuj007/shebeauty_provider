import '../repository/get_all_product_repository.dart';

abstract class GetAllProductUseCase {
  final GetAllProductRepository getAllProductRepository;

  GetAllProductUseCase(this.getAllProductRepository);
}
abstract class OrderDetailsUseCase {
  final GetAllProductRepository getAllProductRepository;

  OrderDetailsUseCase(this.getAllProductRepository);
}

abstract class GetOrdersProductUseCase {
  final GetAllProductRepository getAllProductRepository;

  GetOrdersProductUseCase(this.getAllProductRepository);
}

