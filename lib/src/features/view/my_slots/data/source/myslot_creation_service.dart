import '../../../../../core/di/app_component.dart';
import '../../../../../core/network/configuration.dart';
import '../../../../../core/source/dio_client.dart';
import '../../../../../core/source/model/api_response.dart';
import '../../../../../core/source/session_manager.dart';
import '../../../../../core/utils/constants.dart';
import '../model/appointment_created_model.dart';
import '../model/my_slot_list_model.dart';
import '../model/myslot_creation_model.dart';
var session = locator<SessionManager>();

class MySlotCreateService {
  final DioClient _dioClient = locator<DioClient>();

  Future<Response<MySlotCreationModel>?> myslotCreate(Map<String, Object> data) async {
    Response<MySlotCreationModel>? apiResponse;

    print("my slot data $data");
   await _dioClient.post(
      path: NetworkConfiguration.mySlotCreate,
      request: data,
      responseCallback: (response, message) {
          var registrationModel = MySlotCreationModel.fromJson(response);
          apiResponse = Response.success(registrationModel);
      },
      failureCallback: (message, status) {
        print("this is message error $message $status");
        apiResponse = Response.error(message, status);
      },
    );


    logger.e("api response ${apiResponse?.data}");
    return apiResponse;
  }

  Future<Response<MySlotListModel>?> getMySlotList() async {
    Response<MySlotListModel>? apiResponse;
    await _dioClient.get(
      path: NetworkConfiguration.mySlotsList,
      responseCallback: (response, message) {
        var registrationModel = MySlotListModel.fromJson(response);
        apiResponse = Response.success(registrationModel);
      },
      failureCallback: (message, status) {
        print("this is message error $message $status");
        apiResponse = Response.error(message, status);
      },
    );
    logger.e("api response ${apiResponse?.data}");
    return apiResponse;
  }
  Future<Response<AppointmentCreatedModel>?> createAppointment(Map<String, Object> data) async {
    Response<AppointmentCreatedModel>? apiResponse;

    print("my slot data $data");
    await _dioClient.post(
      path: NetworkConfiguration.createAppointment,
      request: data,
      responseCallback: (response, message) {
        var registrationModel = AppointmentCreatedModel.fromJson(response);
        apiResponse = Response.success(registrationModel);
      },
      failureCallback: (message, status) {
        print("this is message error $message $status");
        apiResponse = Response.error(message, status);
      },
    );


    logger.e("api response ${apiResponse?.data}");
    return apiResponse;
  }
}
