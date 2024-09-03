class ExpertsListModel {
  String? message;
  List<Data>? data;

  ExpertsListModel({this.message, this.data});

  ExpertsListModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? profileImage;
  String? expartyear;
  String? gender;
  String? mobile;
  String? certificateImages;
  String? agentId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.name,
      this.profileImage,
      this.expartyear,
      this.gender,
      this.mobile,
      this.certificateImages,
      this.agentId,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profileImage = json['profile_image'];
    expartyear = json['expartyear'];
    gender = json['gender'];
    mobile = json['mobile'];
    certificateImages = json['certificate_images'];
    agentId = json['agent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['profile_image'] = this.profileImage;
    data['expartyear'] = this.expartyear;
    data['gender'] = this.gender;
    data['mobile'] = this.mobile;
    data['certificate_images'] = this.certificateImages;
    data['agent_id'] = this.agentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
