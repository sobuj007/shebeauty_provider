import '../../../../../core/source/model/api_response.dart';
import '../../data/model/appointment_created_model.dart';
import '../../data/model/my_slot_list_model.dart';
import '../../data/model/myslot_creation_model.dart';
import '../../data/source/myslot_creation_service.dart';
import 'package:dio/dio.dart'as dio;
abstract class MySlotCreateRepository {
  final MySlotCreateService mySlotCreateService;

  MySlotCreateRepository(this.mySlotCreateService);

  Future<Response<MySlotCreationModel?>?> myslotCreate(Map<String, Object> data);
  Future<Response<AppointmentCreatedModel?>?> createAppointment(Map<String, Object> data);
  Future<Response<MySlotListModel?>?> getMySlotList();
}
