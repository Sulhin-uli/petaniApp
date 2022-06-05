import 'package:petani_app/app/utils/base_url.dart';
import 'package:get/get.dart';

class PoktanProvider extends GetConnect {
  String url = baseUrl + "poktan";

  Future<dynamic> postData(
    String name,
    String email,
    String password,
    int gapoktanId,
    bool isActive,
    String token,
  ) async {
    final response = await post(url, {
      "name": name,
      "email": email,
      "password": password,
      "gapoktan_id": gapoktanId,
      "is_active": isActive,
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

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

  Future<void> deleteData(
    int? id,
    String token,
  ) async =>
      await delete(url + '/$id', headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

  Future<void> updateData(
    int id,
    int userId,
    String name,
    String email,
    String? password,
    int gapoktanId,
    bool isActive,
    String token,
  ) async {
    final response = await put(url + '/$id', {
      "id": id,
      "user_id": userId,
      "name": name,
      "email": email,
      "password": password,
      "gapoktanId": gapoktanId,
      "is_active": isActive,
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }
}
