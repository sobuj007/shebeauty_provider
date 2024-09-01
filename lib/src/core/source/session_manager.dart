

import 'package:shebeauty_provider/src/core/source/pref_manager.dart';

import '../../features/view/auth/login/data/model/login_model.dart';

class SessionManager {
  Future<bool> createSession(LoginModel? loginModelData, {String? email,  String? password}) async {
    print("this is session ${loginModelData?.token}");
    try {
        setToken = loginModelData?.token;
        setPassword = password;
        setEmail = email;
        setFullName = loginModelData?.user?.name;
      return true;
    } catch (e) {
      return false;
    }
  }


  final PrefManager _prefManager;
  SessionManager(this._prefManager);
  String? get getFullName =>
      _prefManager.getStringValue("fullName");
  set setFullName(String? value) => _prefManager.saveString(
      "fullName", value ?? "");

  String? get getUserPID =>
      _prefManager.getStringValue("userPID");
  set setUserPID(String? value) => _prefManager.saveString(
      "userPID", value ?? "");

  String? get getPassword =>
      _prefManager.getStringValue("password");
  set setPassword(String? value) => _prefManager.saveString(
      "password", value ?? "");

  String? get getEmail =>
      _prefManager.getStringValue("email");
  set setEmail(String? value) => _prefManager.saveString(
      "email", value ?? "");

  String? get getPhoneNumber =>
      _prefManager.getStringValue("phoneNumber");
  set setPhoneNumber(String? value) => _prefManager.saveString(
      "phoneNumber", value ?? "");


  String? get getPhoto =>
      _prefManager.getStringValue("photo");
  set setPhoto(String? value) => _prefManager.saveString(
      "photo", value ?? "");


set setBaseUrl(String? value)=> _prefManager.saveString("baseUrl", value);
  String? get getBaseUrl =>
      _prefManager.getStringValue("baseUrl");
  set setToken(String? value)=> _prefManager.saveString("token", value);
  String? get getToken =>
      _prefManager.getStringValue("token");

  set setCandidateId(String? value)=> _prefManager.saveString("candidateId", value);
  String? get getCandidateId =>
      _prefManager.getStringValue("candidateId");

  String? get getDeviceId =>
      _prefManager.getStringValue("deviceId");
  set setDeviceId(String? value) => _prefManager.saveString(
      "deviceId", value ?? "");

  Future<bool> logout() async {
    bool response = false;
    await _prefManager.logOut().whenComplete(() {
      response = true;
    });
    return response;
  }
}
