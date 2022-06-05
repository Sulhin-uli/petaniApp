import 'package:petani_app/app/data/models/education_category_model.dart';
import 'package:petani_app/app/data/models/user_model.dart';

class Education {
  int? id;
  User? userId;
  EducationCategory? categoryEducationId;
  String? title;
  String? slug;
  String? date;
  String? file;
  String? desc;
  String? createdAt;
  String? updatedAt;

  Education(
      {this.id,
      this.userId,
      this.categoryEducationId,
      this.title,
      this.slug,
      this.date,
      this.file,
      this.desc,
      this.createdAt,
      this.updatedAt});

  Education.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'] != null ? User?.fromJson(json['user_id']) : null;
    categoryEducationId = json['category_education_id'] != null
        ? EducationCategory?.fromJson(json['category_education_id'])
        : null;
    title = json['title'];
    slug = json['slug'];
    date = json['date'];
    file = json['file'];
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
    if (categoryEducationId != null) {
      data['category_education_id'] = categoryEducationId?.toJson();
    }
    data['title'] = title;
    data['slug'] = slug;
    data['date'] = date;
    data['file'] = file;
    data['desc'] = desc;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
