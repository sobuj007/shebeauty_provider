class MySlotCreationModel {
  String? message;
  Data? data;

  MySlotCreationModel({this.message, this.data});

  MySlotCreationModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? agentId;
  String? availableOpening;
  String? title;
  String? offday;
  bool? active;
  String? slotDuration;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.agentId,
        this.availableOpening,
        this.title,
        this.offday,
        this.active,
        this.slotDuration,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    agentId = json['agent_id'];
    availableOpening = json['available_opening'];
    title = json['title'];
    offday = json['offday'];
    active = json['active'];
    slotDuration = json['slot_duration'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agent_id'] = this.agentId;
    data['available_opening'] = this.availableOpening;
    data['title'] = this.title;
    data['offday'] = this.offday;
    data['active'] = this.active;
    data['slot_duration'] = this.slotDuration;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
