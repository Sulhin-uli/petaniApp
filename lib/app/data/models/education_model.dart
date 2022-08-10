// To parse this JSON data, do
//
//     final education = educationFromJson(jsonString);

import 'dart:convert';

Education educationFromJson(String str) => Education.fromJson(json.decode(str));

String educationToJson(Education data) => json.encode(data.toJson());

class Education {
  Education({
    this.id,
    this.userId,
    this.categoryEducationId,
    this.title,
    this.slug,
    this.date,
    this.file,
    this.desc,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  UserId? userId;
  CategoryEducationId? categoryEducationId;
  String? title;
  String? slug;
  DateTime? date;
  String? file;
  String? desc;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        id: json["id"],
        userId: UserId.fromJson(json["user_id"]),
        categoryEducationId:
            CategoryEducationId.fromJson(json["category_education_id"]),
        title: json["title"],
        slug: json["slug"],
        date: DateTime.parse(json["date"]),
        file: json["file"],
        desc: json["desc"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId!.toJson(),
        "category_education_id": categoryEducationId!.toJson(),
        "title": title,
        "slug": slug,
        "date": date!.toIso8601String(),
        "file": file,
        "desc": desc,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class CategoryEducationId {
  CategoryEducationId({
    this.id,
    this.name,
    this.slug,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? slug;
  int? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory CategoryEducationId.fromJson(Map<String, dynamic> json) =>
      CategoryEducationId(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "is_active": isActive,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class UserId {
  UserId({
    this.id,
    this.name,
    this.email,
  });

  int? id;
  String? name;
  String? email;

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["id"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
      };
}
