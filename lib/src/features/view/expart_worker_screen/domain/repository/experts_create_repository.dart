import '../../../../../core/source/model/api_response.dart';
import '../../data/model/experts_create_model.dart';
import '../../data/source/experts_create_service.dart';
import 'package:dio/dio.dart'as dio;
abstract class ExpartCreateRepository {
  final ExpartCreateService expartCreateService;

  ExpartCreateRepository(this.expartCreateService);

  Future<Response<ExpertsCreateModel?>?> expertsPass(dio.FormData data);
}
