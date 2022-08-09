import 'package:petani_app/app/modules/login/controllers/login_controller.dart';
import 'package:petani_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthcontrollerController extends GetxController {
  final box = GetStorage();
  LoginController loginController = Get.put(LoginController());

  void dialogError(String msg) {
    Get.defaultDialog(title: "Terjadi Kesalahan", middleText: msg);
  }

  @override
  void onInit() {
    // autoLogin();
    super.onInit();
  }
}
