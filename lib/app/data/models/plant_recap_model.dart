// To parse this JSON data, do
//
//     final plantRecap = plantRecapFromJson(jsonString);

import 'dart:convert';

PlantRecap plantRecapFromJson(String str) =>
    PlantRecap.fromJson(json.decode(str));

String plantRecapToJson(PlantRecap data) => json.encode(data.toJson());

class PlantRecap {
  PlantRecap({
    this.id,
    this.farmerName,
    this.fieldCategoryName,
    this.fieldCategoryDetails,
    this.datePlanting,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.name,
  });

  int? id;
  String? farmerName;
  String? fieldCategoryName;
  String? fieldCategoryDetails;
  DateTime? datePlanting;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? name;

  factory PlantRecap.fromJson(Map<String, dynamic> json) => PlantRecap(
        id: json["id"],
        farmerName: json["farmer_name"],
        fieldCategoryName: json["field_category_name"],
        fieldCategoryDetails: json["field_category_details"],
        datePlanting: DateTime.parse(json["date_planting"]),
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "farmer_name": farmerName,
        "field_category_name": fieldCategoryName,
        "field_category_details": fieldCategoryDetails,
        "date_planting": datePlanting!.toIso8601String(),
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "name": name,
      };
}
