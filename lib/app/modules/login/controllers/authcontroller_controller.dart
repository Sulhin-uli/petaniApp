import 'package:petani_app/app/data/providers/login_provider.dart';
import 'package:petani_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthcontrollerController extends GetxController {
  final box = GetStorage();
  var isAuth = false.obs;

  void dialogError(String msg) {
    Get.defaultDialog(title: "Terjadi Kesalahan", middleText: msg);
  }

  @override
  void onInit() {
    autoLogin();
    super.onInit();
  }

  Future<void> autoLogin() async {
    if (box.read("userData") != null) {
      final data = box.read("userData") as Map<String, dynamic>;
      login(data["email"], data["password"]);
    }
  }

  void login(String email, String password) async {
    LoginProvider().login(email, password).then(
      (response) {
        if (email != '' && password != '') {
          if (response['success'] == true) {
            box.write('userData', {
              "id": response['data']['id'],
              "token": response['data']['token'],
              "email": email,
              "password": password
            });
            box.write('isAuth', true);
            Get.toNamed(Routes.HOME);

            // _homeController.changeTabIndex(0);
            // cartController.getData();
          } else {
            dialogError('Akun tidak ditemukan');
          }
        } else {
          dialogError('Semua data input harus di isi');
        }
      },
    );
  }
}
