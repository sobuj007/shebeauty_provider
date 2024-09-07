import '../../../../../core/source/model/api_response.dart';
import '../../data/model/service_model.dart';
import '../../data/source/service_service.dart';
import 'package:dio/dio.dart'as dio;
abstract class ServiceRepository {
  final ServiceProductService serviceProductService;

  ServiceRepository(this.serviceProductService);

  Future<Response<ServiceModel?>?> expertsPass(Map<String, Object> data);
}
