import '../../../../../core/source/model/api_response.dart';
import '../../data/model/experts_create_model.dart';
import 'experts_create_usecase.dart';
import 'package:dio/dio.dart'as dio;

class ExpartCreatePassUseCase extends ExpartCreateUseCase {
  ExpartCreatePassUseCase(super.expartCreateRepository);

  Future<Response<ExpertsCreateModel?>?> call(dio.FormData data) async {
    var response = await expartCreateRepository.expertsPass(data);
    return response;
  }
}

