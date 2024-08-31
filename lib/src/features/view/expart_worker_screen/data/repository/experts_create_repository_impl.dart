
import 'package:shebeauty_provider/src/core/source/model/api_response.dart';

import '../../domain/repository/experts_create_repository.dart';
import '../model/experts_create_model.dart';
import 'package:dio/dio.dart'as dio;
import '../source/experts_create_service.dart';
class ExpartCreateRepositoryImpl extends ExpartCreateRepository {
  ExpartCreateRepositoryImpl(super.expertCreateService);

  @override
  Future<Response<ExpertsCreateModel?>?> expertsPass(dio.FormData data)async {
    Response<ExpertsCreateModel>? apiResponse;
    apiResponse = await expartCreateService.expertsPass(data);
    return apiResponse;
  }
}
