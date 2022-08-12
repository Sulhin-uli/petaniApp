// To parse this JSON data, do
//
//     final harvestRecap = harvestRecapFromJson(jsonString);

import 'dart:convert';

HarvestRecap harvestRecapFromJson(String str) =>
    HarvestRecap.fromJson(json.decode(str));

String harvestRecapToJson(HarvestRecap data) => json.encode(data.toJson());

class HarvestRecap {
  HarvestRecap({
    this.id,
    this.farmerName,
    this.fieldCategoryName,
    this.fieldCategoryDetails,
    this.dateHarvest,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.name,
  });

  int? id;
  String? farmerName;
  String? fieldCategoryName;
  String? fieldCategoryDetails;
  DateTime? dateHarvest;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? name;

  factory HarvestRecap.fromJson(Map<String, dynamic> json) => HarvestRecap(
        id: json["id"],
        farmerName: json["farmer_name"],
        fieldCategoryName: json["field_category_name"],
        fieldCategoryDetails: json["field_category_details"],
        dateHarvest: DateTime.parse(json["date_harvest"]),
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
        "date_harvest": dateHarvest!.toIso8601String(),
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "name": name,
      };
}
