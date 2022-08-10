import 'dart:convert';
import 'package:petani_app/app/utils/base_url.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class EducationProvider extends GetConnect {
  // String url = "http://192.168.43.38:8001/api/education";
  String url = baseUrl + "education";

  // Future<dynamic> postData(
  //     Map<String, String> body, String filepath, String token) async {
  //   Map<String, String> headers = {
  //     'Content-Type': 'multipart/form-data',
  //     'Authorization': 'Bearer $token',
  //   };
  //   var request = http.MultipartRequest('POST', Uri.parse(url))
  //     ..fields.addAll(body)
  //     ..headers.addAll(headers)
  //     ..files.add(await http.MultipartFile.fromPath('file', filepath));
  //   final response = await request.send();
  //   var responsed = await http.Response.fromStream(response);
  //   final responseData = json.decode(responsed.body);
  //   return responseData;
  // }

  // Future<dynamic> updateDataWOfile(
  //   int id,
  //   int userId,
  //   int categoryEducationId,
  //   String title,
  //   String desc,
  //   String token,
  // ) async {
  //   final response = await put('$url/$id', {
  //     "user_id": userId,
  //     "category_education_id": categoryEducationId,
  //     "title": title,
  //     "desc": desc,
  //   }, headers: {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $token',
  //   });
  //   return response.body;
  // }

  // Future<dynamic> updateDataWfile(
  //     Map<String, String> body, String filepath, String token) async {
  //   Map<String, String> headers = {
  //     'Content-Type': 'multipart/form-data',
  //     'Authorization': 'Bearer $token',
  //   };
  //   var request = http.MultipartRequest('POST', Uri.parse(url + '/update/file'))
  //     ..fields.addAll(body)
  //     ..headers.addAll(headers)
  //     ..files.add(await http.MultipartFile.fromPath('file', filepath));
  //   final response = await request.send();
  //   var responsed = await http.Response.fromStream(response);
  //   final responseData = json.decode(responsed.body);
  //   return responseData;
  // }

  Future<dynamic> getData(
    int page,
    String token,
  ) async {
    final response = await get('$url?page=$page', headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<dynamic> getDataSearch(int page, String title, String token) async {
    final response = await get('$url/search/$title?page=$page', headers: {
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
}
