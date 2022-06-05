import 'package:petani_app/app/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';

import '../controllers/saya_controller.dart';

class SayaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SayaController>(
      () => SayaController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
