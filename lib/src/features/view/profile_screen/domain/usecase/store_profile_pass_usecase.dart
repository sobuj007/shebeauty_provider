import '../../../../../core/source/model/api_response.dart';
import '../../data/model/store_profile_model.dart';
import 'store_profile_usecase.dart';
import 'package:dio/dio.dart'as dio;

class StoreProfilePassUseCase extends StoreProfileUseCase {
  StoreProfilePassUseCase(super.expartCreateRepository);

  Future<Response<StoreProfileModel?>?> call(Map<String, Object> data) async {
    var response = await expartCreateRepository.expertsPass(data);
    return response;
  }
}

