import 'package:get/get.dart';
import 'package:petani_app/app/utils/base_url.dart';

class PlantProvider extends GetConnect {
  String url = baseUrl + "plant";

  ////////////////// new //////////////////////////////
  Future<dynamic> getPlantRecap(
    int id,
    int page,
    String token,
  ) async {
    final response = await get("$url/farmer/id/$id?page=$page", headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<dynamic> getField(
    int id,
    int page,
    String token,
  ) async {
    final response = await get("$url/field/id/$id?page=$page", headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<dynamic> storePlant(
    int farmerId,
    int fieldId,
    String datePlanting,
    String token,
  ) async {
    final response = await post("$url/plant/post", {
      "farmer_id": farmerId,
      "field_id": fieldId,
      "date_planting": datePlanting,
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  ////////////////// old //////////////////////////////

  Future<dynamic> getData(
    String token,
  ) async {
    final response = await get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<dynamic> postData(
    int farmerId,
    int poktanId,
    String plantTanaman,
    String surfaceArea,
    String address,
    String platingDate,
    dynamic harvestDate,
    String token,
  ) async {
    final response = await post(url, {
      "farmer_id": farmerId,
      "poktan_id": poktanId,
      "plant_tanaman": plantTanaman,
      "surface_area": surfaceArea,
      "address": address,
      "plating_date": platingDate,
      "harvest_date": harvestDate,
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

  Future<dynamic> updateData(
    int id,
    String plantTanaman,
    String surfaceArea,
    String platingDate,
    String address,
    String harvestDate,
    String token,
  ) async {
    final response = await put(url + '/$id', {
      "plant_tanaman": plantTanaman,
      "surface_area": surfaceArea,
      "address": address,
      "plating_date": platingDate,
      "harvest_date": harvestDate,
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
        url + '/$id',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

  Future<void> addHarvestDate(
    int id,
    String harvestDate,
    String token,
  ) async {
    final response = await put('$url/harvest-date' '/$id', {
      "harvest_date": harvestDate,
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<void> updateStatus(
    int id,
    String token,
  ) async {
    final response = await put('$url/status' '/$id', {}, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }
}
