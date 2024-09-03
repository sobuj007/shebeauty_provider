class AppointmentCreatedModel {
  String? message;
  Data? data;
  Myslot? slotDetails;

  AppointmentCreatedModel({this.message, this.data, this.slotDetails});

  AppointmentCreatedModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    slotDetails = json['slot_details'] != null
        ? new Myslot.fromJson(json['slot_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.slotDetails != null) {
      data['slot_details'] = this.slotDetails!.toJson();
    }
    return data;
  }
}

class Data {
  String? slotId;
  int? agentId;
  String? time;
  String? note;
  String? updatedAt;
  String? createdAt;
  int? id;
  Myslot? myslot;

  Data(
      {this.slotId,
        this.agentId,
        this.time,
        this.note,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.myslot});

  Data.fromJson(Map<String, dynamic> json) {
    slotId = json['slot_id'];
    agentId = json['agent_id'];
    time = json['time'];
    note = json['note'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    myslot =
    json['myslot'] != null ? new Myslot.fromJson(json['myslot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slot_id'] = this.slotId;
    data['agent_id'] = this.agentId;
    data['time'] = this.time;
    data['note'] = this.note;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
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
