
import 'package:shebeauty_provider/src/core/source/model/api_response.dart';

import '../../domain/repository/service_repository.dart';
import '../model/service_model.dart';
import 'package:dio/dio.dart'as dio;
import '../source/service_service.dart';
class ServiceRepositoryImpl extends ServiceRepository {
  ServiceRepositoryImpl(super.serviceProductService);

  @override
  Future<Response<ServiceModel?>?> expertsPass(Map<String, Object> data)async {
    Response<ServiceModel>? apiResponse;
    apiResponse = await serviceProductService.servicePass(data);
    return apiResponse;
  }
}
