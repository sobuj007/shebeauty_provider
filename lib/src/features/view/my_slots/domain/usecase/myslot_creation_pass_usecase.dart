import '../../../../../core/source/model/api_response.dart';
import '../../data/model/appointment_created_model.dart';
import '../../data/model/my_slot_list_model.dart';
import '../../data/model/myslot_creation_model.dart';
import 'myslot_creation_usecase.dart';

class MySlotCreatePassUseCase extends MySlotCreateUseCase {
  MySlotCreatePassUseCase(super.regRepository);

  Future<Response<MySlotCreationModel?>?> call(Map<String, Object> data) async {
    var response = await regRepository.myslotCreate(data);
    return response;
  }
}

class AppointmentCreatePassUseCase extends AppointmentCreateUseCase {
  AppointmentCreatePassUseCase(super.regRepository);

  Future<Response<AppointmentCreatedModel?>?> call(Map<String, Object> data) async {
    var response = await regRepository.createAppointment(data);
    return response;
  }
}

class MySlotListPassUseCase extends MySlotListUseCase {
  MySlotListPassUseCase(super.regRepository);

  Future<Response<MySlotListModel?>?> call() async {
    var response = await regRepository.getMySlotList();
    return response;
  }
}

