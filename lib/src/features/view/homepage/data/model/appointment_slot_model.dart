class AppointmentSlotModel {
  String? message;
  List<Data>? data;

  AppointmentSlotModel({this.message, this.data});

  AppointmentSlotModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? slotId;
  String? agentId;
  String? time;
  String? note;
  String? createdAt;
  String? updatedAt;
  Myslot? myslot;

  Data(
      {this.id,
        this.slotId,
        this.agentId,
        this.time,
        this.note,
        this.createdAt,
        this.updatedAt,
        this.myslot});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slotId = json['slot_id'];
    agentId = json['agent_id'];
    time = json['time'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    myslot =
    json['myslot'] != null ? new Myslot.fromJson(json['myslot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slot_id'] = this.slotId;
    data['agent_id'] = this.agentId;
    data['time'] = this.time;
    data['note'] = this.note;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.myslot != null) {
      data['myslot'] = this.myslot!.toJson();
    }
    return data;
  }
}

class Myslot {
  int? id;
  String? agentId;
  String? title;
  String? availableOpening;
  String? offday;
  String? active;
  String? slotDuration;
  String? createdAt;
  String? updatedAt;

  Myslot(
      {this.id,
        this.agentId,
        this.title,
        this.availableOpening,
        this.offday,
        this.active,
        this.slotDuration,
        this.createdAt,
        this.updatedAt});

  Myslot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agentId = json['agent_id'];
    title = json['title'];
    availableOpening = json['available_opening'];
    offday = json['offday'];
    active = json['active'];
    slotDuration = json['slot_duration'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['agent_id'] = this.agentId;
    data['title'] = this.title;
    data['available_opening'] = this.availableOpening;
    data['offday'] = this.offday;
    data['active'] = this.active;
    data['slot_duration'] = this.slotDuration;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
