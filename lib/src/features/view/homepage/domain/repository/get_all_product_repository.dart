import 'package:shebeauty_provider/src/features/view/homepage/data/model/order_details_model.dart';

import '../../../../../core/source/model/api_response.dart';
import '../../data/model/all_order_model.dart';
import '../../data/model/get_all_product_model.dart';
import '../../data/source/get_all_product_service.dart';
import 'package:dio/dio.dart'as dio;
abstract class GetAllProductRepository {
  final GetAllProductService getAllProductService;

  GetAllProductRepository(this.getAllProductService);

  Future<Response<GetAllProductModel?>?> getAllProductPass();
  Future<Response<OrderDetailsModel?>?> ordersDetailsPass({required String id});
  Future<Response<List<AllOrdersModel>>?> getAllOrderList();
}
