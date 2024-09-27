class ServiceModel {
  bool? success;
  String? message;
  Data? data;

  ServiceModel({this.success, this.message, this.data});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? name;
  String? description;
  String? image;
  var productPrice;
  var servicePrice;
  String? gender;
  var categoryId;
  var subcategoryId;
  var bodypartId;
  var cityId;
  var slotId;
  String? appointmentSlotIds;
  String? locationIds;
  int? agentId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.name,
        this.description,
        this.image,
        this.productPrice,
        this.servicePrice,
        this.gender,
        this.categoryId,
        this.subcategoryId,
        this.bodypartId,
        this.cityId,
        this.slotId,
        this.appointmentSlotIds,
        this.locationIds,
        this.agentId,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    image = json['image'];
    productPrice = json['product_price'];
    servicePrice = json['service_price'];
    gender = json['gender'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    bodypartId = json['bodypart_id'];
    cityId = json['city_id'];
    slotId = json['slot_id'];
    appointmentSlotIds = json['appointment_slot_ids'];
    locationIds = json['location_ids'];
    agentId = json['agent_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['product_price'] = this.productPrice;
    data['service_price'] = this.servicePrice;
    data['gender'] = this.gender;
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['bodypart_id'] = this.bodypartId;
    data['city_id'] = this.cityId;
    data['slot_id'] = this.slotId;
    data['appointment_slot_ids'] = this.appointmentSlotIds;
    data['location_ids'] = this.locationIds;
    data['agent_id'] = this.agentId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
