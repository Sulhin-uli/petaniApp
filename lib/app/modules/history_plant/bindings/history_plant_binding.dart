import 'package:get/get.dart';

import '../controllers/history_plant_controller.dart';

class HistoryPlantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryPlantController>(
      () => HistoryPlantController(),
    );
  }
}
