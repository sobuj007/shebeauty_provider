import '../../../../../core/source/model/api_response.dart';
import '../../data/model/service_model.dart';
import 'service_usecase.dart';
import 'package:dio/dio.dart'as dio;

class ServicePassUseCase extends ServiceUseCase {
  ServicePassUseCase(super.expartCreateRepository);

  Future<Response<ServiceModel?>?> call(Map<String, Object> data) async {
    var response = await expartCreateRepository.expertsPass(data);
    return response;
  }
}

