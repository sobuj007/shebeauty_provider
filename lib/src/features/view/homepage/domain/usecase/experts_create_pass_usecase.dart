import 'package:shebeauty_provider/src/features/view/homepage/data/model/order_details_model.dart';

import '../../../../../core/source/model/api_response.dart';
import '../../data/model/all_order_model.dart';
import '../../data/model/get_all_product_model.dart';
import 'experts_create_usecase.dart';

class GetAllProductPassUseCase extends GetAllProductUseCase {
  GetAllProductPassUseCase(super.getAllProductRepository);

  Future<Response<GetAllProductModel?>?> call() async {
    var response = await getAllProductRepository.getAllProductPass();
    return response;
  }
}
class GetOrdersPassUseCase extends GetOrdersProductUseCase{
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