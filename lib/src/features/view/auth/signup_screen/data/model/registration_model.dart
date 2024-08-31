class RegistrationModel {
  String? message;
  Token? token;

  RegistrationModel({this.message, this.token});

  RegistrationModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.token != null) {
      data['token'] = this.token!.toJson();
    }
    return data;
  }
}

class Token {
  String? name;
  List<String>? abilities;
  Null? expiresAt;
  int? tokenableId;
  String? tokenableType;
  String? updatedAt;
  String? createdAt;
  int? id;

  Token(
      {this.name,
        this.abilities,
        this.expiresAt,
        this.tokenableId,
        this.tokenableType,
        this.updatedAt,
        this.createdAt,
        this.id});

  Token.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    abilities = json['abilities'].cast<String>();
    expiresAt = json['expires_at'];
    tokenableId = json['tokenable_id'];
    tokenableType = json['tokenable_type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['abilities'] = this.abilities;
    data['expires_at'] = this.expiresAt;
    data['tokenable_id'] = this.tokenableId;
    data['tokenable_type'] = this.tokenableType;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
