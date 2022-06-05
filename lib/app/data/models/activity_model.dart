import 'package:petani_app/app/data/models/activity_category_model.dart';
import 'package:petani_app/app/data/models/user_model.dart';

class Activity {
  int? id;
  User? userId;
  ActivityCategory? categoryActivityId;
  String? title;
  String? slug;
  String? date;
  String? desc;
  String? createdAt;
  String? updatedAt;

  Activity(
      {this.id,
      this.userId,
      this.categoryActivityId,
      this.title,
      this.slug,
      this.date,
      this.desc,
      this.createdAt,
      this.updatedAt});

  Activity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'] != null ? User?.fromJson(json['user_id']) : null;
    categoryActivityId = json['category_activity_id'] != null
        ? ActivityCategory?.fromJson(json['category_activity_id'])
        : null;
    title = json['title'];
    slug = json['slug'];
    date = json['date'];
    desc = json['desc'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (userId != null) {
      data['user_id'] = userId?.toJson();
    }
    data['category_activity_id'] = categoryActivityId;
    if (categoryActivityId != null) {
      data['category_activity_id'] = categoryActivityId?.toJson();
    }
    data['title'] = title;
    data['slug'] = slug;
    data['date'] = date;
    data['desc'] = desc;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
