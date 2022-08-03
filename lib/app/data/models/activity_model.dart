// To parse this JSON data, do
//
//     final activity = activityFromJson(jsonString);

import 'dart:convert';

Activity activityFromJson(String str) => Activity.fromJson(json.decode(str));

String activityToJson(Activity data) => json.encode(data.toJson());

class Activity {
  Activity({
    this.id,
    this.userId,
    this.categoryActivityId,
    this.title,
    this.slug,
    this.date,
    this.desc,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  UserId? userId;
  dynamic categoryActivityId;
  String? title;
  String? slug;
  DateTime? date;
  String? desc;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        userId: UserId.fromJson(json["user_id"]),
        categoryActivityId: json["category_activity_id"],
        title: json["title"],
        slug: json["slug"],
        date: DateTime.parse(json["date"]),
        desc: json["desc"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId!.toJson(),
        "category_activity_id": categoryActivityId,
        "title": title,
        "slug": slug,
        "date": date!.toIso8601String(),
        "desc": desc,
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
