
import 'package:shebeauty_provider/src/core/source/model/api_response.dart';

import '../../domain/repository/get_all_product_repository.dart';
import '../model/all_order_model.dart';
import '../model/get_all_product_model.dart';
import 'package:dio/dio.dart'as dio;
import '../model/order_details_model.dart';
import '../source/get_all_product_service.dart';
class  GetAllProductRepositoryImpl extends GetAllProductRepository {
  GetAllProductRepositoryImpl(super.getAllProductService);

  @override
  Future<Response<GetAllProductModel?>?> getAllProductPass()async {
    Response<GetAllProductModel>? apiResponse;
    apiResponse = await getAllProductService.getAllProductPass();
    return apiResponse;
  }
  @override
  Future<Response<List<AllOrdersModel>>?> getAllOrderList()async {
    Response<List<AllOrdersModel>>? apiResponse;
    apiResponse = await getAllProductService.getAllOrderList();
    return apiResponse;
  }
  @override
  Future<Response<OrderDetailsModel?>?> ordersDetailsPass({required String id})async {
    Response<OrderDetailsModel>? apiResponse;
    apiResponse = await getAllProductService.orderDetailsPass(id: id);
    return apiResponse;
  }
}
