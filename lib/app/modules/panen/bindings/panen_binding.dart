import 'package:get/get.dart';

import '../controllers/panen_controller.dart';

class PanenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PanenController>(
      () => PanenController(),
    );
  }
}
