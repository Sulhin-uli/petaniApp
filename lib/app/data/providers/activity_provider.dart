import 'package:petani_app/app/utils/base_url.dart';
import 'package:get/get.dart';

class ActivityProvider extends GetConnect {
  String url = baseUrl + "activity";

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

  // Future<dynamic> searchData(
  //   String token,
  //   String name,
  // ) async {
  //   final response = await get(url + 'search/$name', headers: {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $token',
  //   });
  //   return response.body;
  // }
}
