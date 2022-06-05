import 'package:petani_app/app/modules/login/controllers/authcontroller_controller.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<AuthcontrollerController>(
      () => AuthcontrollerController(),
    );
  }
}
