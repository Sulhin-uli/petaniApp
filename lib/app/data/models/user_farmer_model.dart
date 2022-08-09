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
    this.poktanId,
    this.city,
    this.address,
    this.telp,
    this.image,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.password,
    this.user,
  });

  int? id;
  int? userId;
  int? poktanId;
  String? city;
  String? address;
  int? telp;
  String? image;
  int? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? password;
  User? user;

  factory Farmers.fromJson(Map<String, dynamic> json) => Farmers(
        id: json["id"],
        userId: json["user_id"],
        poktanId: json["poktan_id"],
        city: json["city"],
        address: json["address"],
        telp: json["telp"],
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
        "poktan_id": poktanId,
        "city": city,
        "address": address,
        "telp": telp,
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
    this.isEmailVerified,
    this.roles,
  });

  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? token;
  DateTime? tokenExpire;
  dynamic fcmToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? isEmailVerified;
  List<Role>? roles;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        token: json["token"],
        tokenExpire: DateTime.parse(json["token_expire"]),
        fcmToken: json["fcm_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isEmailVerified: json["is_email_verified"],
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "token": token,
        "token_expire": tokenExpire!.toIso8601String(),
        "fcm_token": fcmToken,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "is_email_verified": isEmailVerified,
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
