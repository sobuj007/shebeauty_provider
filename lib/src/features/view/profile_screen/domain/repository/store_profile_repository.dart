import '../../../../../core/source/model/api_response.dart';
import '../../data/model/store_profile_get.dart';
import '../../data/model/store_profile_model.dart';
import '../../data/source/store_profile_service.dart';
import 'package:dio/dio.dart'as dio;
abstract class StoreProfileRepository {
  final StoreProfileService serviceProductService;

  StoreProfileRepository(this.serviceProductService);

  Future<Response<StoreProfileModel?>?> expertsPass(Map<String, Object> data);
  Future<Response<StoreProfileGetModel?>?> storeProfileGet();
}
