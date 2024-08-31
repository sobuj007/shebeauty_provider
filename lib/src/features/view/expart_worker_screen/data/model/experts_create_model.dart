class ExpertsCreateModel {
  String? message;
  Data? data;

  ExpertsCreateModel({this.message, this.data});

  ExpertsCreateModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? profileImage;
  String? expartyear;
  String? gender;
  String? mobile;
  String? certificateImages;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.agentId,
        this.name,
        this.profileImage,
        this.expartyear,
        this.gender,
        this.mobile,
        this.certificateImages,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    agentId = json['agent_id'];
    name = json['name'];
    profileImage = json['profile_image'];
    expartyear = json['expartyear'];
    gender = json['gender'];
    mobile = json['mobile'];
    certificateImages = json['certificate_images'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agent_id'] = this.agentId;
    data['name'] = this.name;
    data['profile_image'] = this.profileImage;
    data['expartyear'] = this.expartyear;
    data['gender'] = this.gender;
    data['mobile'] = this.mobile;
    data['certificate_images'] = this.certificateImages;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
