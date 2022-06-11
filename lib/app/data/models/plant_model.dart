import 'package:petani_app/app/data/models/farmer_model.dart';
import 'package:petani_app/app/data/models/poktan_model.dart';

class Plant {
  int? id;
  Farmer? farmerId;
  Poktan? poktanId;
  String? plantTanaman;
  String? surfaceArea;
  String? address;
  String? platingDate;
  String? harvestDate;
  bool? isMark;
  String? createdAt;
  String? updatedAt;

  Plant(
      {this.id,
      this.farmerId,
      this.poktanId,
      this.plantTanaman,
      this.surfaceArea,
      this.address,
      this.platingDate,
      this.harvestDate,
      this.isMark,
      this.createdAt,
      this.updatedAt});

  Plant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    farmerId =
        json['farmer_id'] != null ? Farmer?.fromJson(json['farmer_id']) : null;
    poktanId =
        json['poktan_id'] != null ? Poktan?.fromJson(json['poktan_id']) : null;
    plantTanaman = json['plant_tanaman'];
    surfaceArea = json['surface_area'];
    address = json['address'];
    platingDate = json['plating_date'];
    harvestDate = json['harvest_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  // Map<String, dynamic> toJson() {
  //   final data = <String, dynamic>{};
  //   data['id'] = id;
  //   if (farmerId != null) {
  //     data['farmer_id'] = farmerId!.toJson();
  //   }
  //   if (poktanId != null) {
  //     data['poktan_id'] = poktanId?.toJson();
  //   }
  //   data['plant_tanaman'] = plantTanaman;
  //   data['surface_area'] = surfaceArea;
  //   data['plating_date'] = platingDate;
  //   data['harvest_date'] = harvestDate;
  //   data['created_at'] = createdAt;
  //   data['updated_at'] = updatedAt;
  //   return data;
  // }
}
