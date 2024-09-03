
import '../../../../../core/source/model/api_response.dart';
import '../../domain/repository/myslot_creation_repository.dart';
import '../model/appointment_created_model.dart';
import '../model/my_slot_list_model.dart';
import '../model/myslot_creation_model.dart';
import '../source/myslot_creation_service.dart';
import 'package:dio/dio.dart'as dio;
class MySlotCreateRepositoryImpl extends MySlotCreateRepository {
  MySlotCreateRepositoryImpl(MySlotCreateService mySlotCreateService) : super(mySlotCreateService);

  @override
  Future<Response<MySlotCreationModel?>?> myslotCreate(Map<String, Object> data) async {
    Response<MySlotCreationModel>? apiResponse;
    apiResponse = await mySlotCreateService.myslotCreate(data);
    return apiResponse;
  }
  @override
  Future<Response<AppointmentCreatedModel?>?> createAppointment(Map<String, Object> data) async {
    Response<AppointmentCreatedModel>? apiResponse;
    apiResponse = await mySlotCreateService.createAppointment(data);
    return apiResponse;
  }
  @override
  Future<Response<MySlotListModel?>?> getMySlotList() async {
    Response<MySlotListModel>? apiResponse;
    apiResponse = await mySlotCreateService.getMySlotList();
    return apiResponse;
  }

}
