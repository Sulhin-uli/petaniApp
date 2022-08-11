// To parse this JSON data, do
//
//     final field = fieldFromJson(jsonString);

import 'dart:convert';

Field fieldFromJson(String str) => Field.fromJson(json.decode(str));

String fieldToJson(Field data) => json.encode(data.toJson());

class Field {
  Field({
    this.id,
    this.fieldCategoryName,
    this.fieldCategoryDetails,
    this.gapoktanName,
    this.farmerName,
  });

  int? id;
  String? fieldCategoryName;
  String? fieldCategoryDetails;
  String? gapoktanName;
  String? farmerName;

  factory Field.fromJson(Map<String, dynamic> json) => Field(
        id: json["id"],
        fieldCategoryName: json["field_category_name"],
        fieldCategoryDetails: json["field_category_details"],
        gapoktanName: json["gapoktan_name"],
        farmerName: json["farmer_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "field_category_name": fieldCategoryName,
        "field_category_details": fieldCategoryDetails,
        "gapoktan_name": gapoktanName,
        "farmer_name": farmerName,
      };
}
