class AllOrdersModel {
  int? id;
  String? userId;
  String? agentId;
  String? totalAmount;
  var orderDate;
  var userreqtime;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<OrderProducts>? orderProducts;
  var payment;

  AllOrdersModel(
      {this.id,
        this.userId,
        this.agentId,
        this.totalAmount,
        this.orderDate,
        this.userreqtime,
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
    userreqtime = json['userreqtime'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['order_products'] != null) {
      orderProducts = <OrderProducts>[];
      json['order_products'].forEach((v) {
        orderProducts!.add(OrderProducts.fromJson(v));
      });
    }
    payment = json['payment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['agent_id'] = agentId;
    data['total_amount'] = totalAmount;
    data['order_date'] = orderDate;
    data['userreqtime'] = userreqtime;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (orderProducts != null) {
      data['order_products'] =
          orderProducts!.map((v) => v.toJson()).toList();
    }
    data['payment'] = payment;
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
        ? ServiceProduct.fromJson(json['service_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['service_product_id'] = serviceProductId;
    data['product_quantity'] = productQuantity;
    data['product_price'] = productPrice;
    data['service_quantity'] = serviceQuantity;
    data['service_price'] = servicePrice;
    data['selected_slot'] = selectedSlot;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (serviceProduct != null) {
      data['service_product'] = serviceProduct!.toJson();
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
  String? slotId;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['agent_id'] = agentId;
    data['category_id'] = categoryId;
    data['subcategory_id'] = subcategoryId;
    data['bodypart_id'] = bodypartId;
    data['city_id'] = cityId;
    data['location_ids'] = locationIds;
    data['slot_id'] = slotId;
    data['appointment_slot_ids'] = appointmentSlotIds;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['product_price'] = productPrice;
    data['service_price'] = servicePrice;
    data['gender'] = gender;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
