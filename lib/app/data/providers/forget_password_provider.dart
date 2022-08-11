import 'package:get/get.dart';
import 'package:petani_app/app/utils/base_url.dart';

class ForgetPasswordProvider extends GetConnect {
  String url = baseUrl + "forget-password";

  Future<dynamic> postData(String email) async {
    final response = await post('$url', {"email": email});
    return response.body;
  }
}
