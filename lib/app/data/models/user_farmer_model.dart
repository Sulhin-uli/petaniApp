// To parse this JSON data, do
//
//     final userFarmerModel = userFarmerModelFromJson(jsonString);

import 'dart:convert';

UserFarmerModel userFarmerModelFromJson(String str) =>
    UserFarmerModel.fromJson(json.decode(str));

String userFarmerModelToJson(UserFarmerModel data) =>
    json.encode(data.toJson());

class UserFarmerModel {
  UserFarmerModel({
    this.farmers,
    this.token,
  });

  Farmers? farmers;
  String? token;

  factory UserFarmerModel.fromJson(Map<String, dynamic> json) =>
      UserFarmerModel(
        farmers: Farmers.fromJson(json["farmers"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "farmers": farmers!.toJson(),
        "token": token,
      };
}

class Farmers {
  Farmers({
    this.id,
    this.userId,
    this.gapoktanId,
    this.poktanId,
    this.provinceId,
    this.cityId,
    this.districtId,
    this.villageId,
    this.street,
    this.number,
    this.phone,
    this.image,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.password,
    this.user,
  });

  int? id;
  int? userId;
  int? gapoktanId;
  int? poktanId;
  dynamic provinceId;
  dynamic cityId;
  dynamic districtId;
  dynamic villageId;
  dynamic street;
  dynamic number;
  dynamic phone;
  dynamic image;
  int? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? password;
  User? user;

  factory Farmers.fromJson(Map<String, dynamic> json) => Farmers(
        id: json["id"],
        userId: json["user_id"],
        gapoktanId: json["gapoktan_id"],
        poktanId: json["poktan_id"],
        provinceId: json["province_id"],
        cityId: json["city_id"],
        districtId: json["district_id"],
        villageId: json["village_id"],
        street: json["street"],
        number: json["number"],
        phone: json["phone"],
        image: json["image"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        password: json["password"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "gapoktan_id": gapoktanId,
        "poktan_id": poktanId,
        "province_id": provinceId,
        "city_id": cityId,
        "district_id": districtId,
        "village_id": villageId,
        "street": street,
        "number": number,
        "phone": phone,
        "image": image,
        "is_active": isActive,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "password": password,
        "user": user!.toJson(),
      };
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.token,
    this.tokenExpire,
    this.fcmToken,
    this.createdAt,
    this.updatedAt,
    this.roles,
  });

  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  dynamic token;
  dynamic tokenExpire;
  dynamic fcmToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Role>? roles;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        token: json["token"],
        tokenExpire: json["token_expire"],
        fcmToken: json["fcm_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "token": token,
        "token_expire": tokenExpire,
        "fcm_token": fcmToken,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "roles": List<dynamic>.from(roles!.map((x) => x.toJson())),
      };
}

class Role {
  Role({
    this.id,
    this.name,
    this.guardName,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  int? id;
  String? name;
  String? guardName;
  DateTime? createdAt;
  DateTime? updatedAt;
  Pivot? pivot;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        guardName: json["guard_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "guard_name": guardName,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "pivot": pivot!.toJson(),
      };
}

class Pivot {
  Pivot({
    this.modelId,
    this.roleId,
    this.modelType,
  });

  int? modelId;
  int? roleId;
  String? modelType;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        modelId: json["model_id"],
        roleId: json["role_id"],
        modelType: json["model_type"],
      );

  Map<String, dynamic> toJson() => {
        "model_id": modelId,
        "role_id": roleId,
        "model_type": modelType,
      };
}
