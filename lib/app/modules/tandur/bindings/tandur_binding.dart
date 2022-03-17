import 'package:get/get.dart';

import '../controllers/tandur_controller.dart';

class TandurBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TandurController>(
      () => TandurController(),
    );
  }
}
