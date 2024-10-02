
import 'package:shebeauty_provider/src/core/source/model/api_response.dart';

import '../../domain/repository/store_profile_repository.dart';
import '../model/store_profile_get.dart';
import '../model/store_profile_model.dart';
import 'package:dio/dio.dart'as dio;
import '../source/store_profile_service.dart';
class StoreProfileRepositoryImpl extends StoreProfileRepository {
  StoreProfileRepositoryImpl(super.serviceProductService);

  @override
  Future<Response<StoreProfileModel?>?> expertsPass(Map<String, Object> data)async {
    Response<StoreProfileModel>? apiResponse;
    apiResponse = await serviceProductService.servicePass(data);
    return apiResponse;
  }
  @override
  Future<Response<StoreProfileGetModel?>?> storeProfileGet()async {
    Response<StoreProfileGetModel>? apiResponse;
    apiResponse = await serviceProductService.storeProfileGet();
    return apiResponse;
  }
}
