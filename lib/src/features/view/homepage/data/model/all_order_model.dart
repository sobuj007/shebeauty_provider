class AllOrdersModel {
  int? id;
  String? userId;
  String? agentId;
  String? totalAmount;
  String? orderDate;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<OrderProducts>? orderProducts;
  Null? payment;

  AllOrdersModel(
      {this.id,
        this.userId,
        this.agentId,
        this.totalAmount,
        this.orderDate,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.orderProducts,
        this.payment});

  AllOrdersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    agentId = json['agent_id'];
    totalAmount = json['total_amount'];
    orderDate = json['order_date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['order_products'] != null) {
      orderProducts = <OrderProducts>[];
      json['order_products'].forEach((v) {
        orderProducts!.add(new OrderProducts.fromJson(v));
      });
    }
    payment = json['payment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['agent_id'] = this.agentId;
    data['total_amount'] = this.totalAmount;
    data['order_date'] = this.orderDate;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.orderProducts != null) {
      data['order_products'] =
          this.orderProducts!.map((v) => v.toJson()).toList();
    }
    data['payment'] = this.payment;
    return data;
  }
}

class OrderProducts {
  int? id;
  String? orderId;
  String? serviceProductId;
  String? productQuantity;
  String? productPrice;
  String? serviceQuantity;
  String? servicePrice;
  String? selectedSlot;
  String? createdAt;
  String? updatedAt;
  ServiceProduct? serviceProduct;

  OrderProducts(
      {this.id,
        this.orderId,
        this.serviceProductId,
        this.productQuantity,
        this.productPrice,
        this.serviceQuantity,
        this.servicePrice,
        this.selectedSlot,
        this.createdAt,
        this.updatedAt,
        this.serviceProduct});

  OrderProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    serviceProductId = json['service_product_id'];
    productQuantity = json['product_quantity'];
    productPrice = json['product_price'];
    serviceQuantity = json['service_quantity'];
    servicePrice = json['service_price'];
    selectedSlot = json['selected_slot'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    serviceProduct = json['service_product'] != null
        ? new ServiceProduct.fromJson(json['service_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['service_product_id'] = this.serviceProductId;
    data['product_quantity'] = this.productQuantity;
    data['product_price'] = this.productPrice;
    data['service_quantity'] = this.serviceQuantity;
    data['service_price'] = this.servicePrice;
    data['selected_slot'] = this.selectedSlot;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.serviceProduct != null) {
      data['service_product'] = this.serviceProduct!.toJson();
    }
    return data;
  }
}

class ServiceProduct {
  int? id;
  String? agentId;
  String? categoryId;
  String? subcategoryId;
  String? bodypartId;
  String? cityId;
  String? locationIds;
  Null? slotId;
  String? appointmentSlotIds;
  String? name;
  String? description;
  String? image;
  String? productPrice;
  String? servicePrice;
  String? gender;
  String? createdAt;
  String? updatedAt;

  ServiceProduct(
      {this.id,
        this.agentId,
        this.categoryId,
        this.subcategoryId,
        this.bodypartId,
        this.cityId,
        this.locationIds,
        this.slotId,
        this.appointmentSlotIds,
        this.name,
        this.description,
        this.image,
        this.productPrice,
        this.servicePrice,
        this.gender,
        this.createdAt,
        this.updatedAt});

  ServiceProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agentId = json['agent_id'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    bodypartId = json['bodypart_id'];
    cityId = json['city_id'];
    locationIds = json['location_ids'];
    slotId = json['slot_id'];
    appointmentSlotIds = json['appointment_slot_ids'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    productPrice = json['product_price'];
    servicePrice = json['service_price'];
    gender = json['gender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['agent_id'] = this.agentId;
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['bodypart_id'] = this.bodypartId;
    data['city_id'] = this.cityId;
    data['location_ids'] = this.locationIds;
    data['slot_id'] = this.slotId;
    data['appointment_slot_ids'] = this.appointmentSlotIds;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['product_price'] = this.productPrice;
    data['service_price'] = this.servicePrice;
    data['gender'] = this.gender;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
