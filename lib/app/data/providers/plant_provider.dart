import 'package:get/get.dart';
import 'package:petani_app/app/utils/base_url.dart';

import '../models/plant_model.dart';

class PlantProvider extends GetConnect {
  String url = baseUrl + "plant";

  Future<dynamic> postData(
    int farmer_id,
    int poktan_id,
    String plant_tanaman,
    String surface_area,
    String plating_date,
    dynamic harvest_date,
    String token,
  ) async {
    final response = await post('$url', {
      "farmer_id": farmer_id,
      "poktan_id": poktan_id,
      "plant_tanaman": plant_tanaman,
      "surface_area": surface_area,
      "plating_date": plating_date,
      "harvest_date": harvest_date,
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<dynamic> getDataById(
    int id,
    String token,
  ) async {
    final response = await get('$url/farmer/$id', headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<void> updateData(
    int id,
    String plant_tanaman,
    String surface_area,
    String plating_date,
    String harvest_date,
    String token,
  ) async {
    final response = await put('$url' + '/$id', {
      "plant_tanaman": plant_tanaman,
      "surface_area": surface_area,
      "plating_date": plating_date,
      "harvest_date": harvest_date,
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<void> deleteData(
    int? id,
    String token,
  ) async =>
      await delete(
        '$url' + '/$id',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

  Future<void> addHarvestDate(
    int id,
    String harvest_date,
    String token,
  ) async {
    final response = await put('$url/harvest-date' + '/$id', {
      "harvest_date": harvest_date,
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }
}
