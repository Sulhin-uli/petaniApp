import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:petani_app/app/data/models/harvest_recap_model.dart';
import 'package:petani_app/app/data/models/plant_for_harvest_modal.dart';
import 'package:petani_app/app/data/providers/plant_provider.dart';
import 'package:petani_app/app/routes/app_pages.dart';
import 'package:petani_app/app/utils/constant.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PanenController extends GetxController {
  @override
  void onInit() {
    getHarvestRecap();
    super.onInit();
  }

  final box = GetStorage();

  /// Harvest
  var harvestRecap = List<HarvestRecap>.empty().obs;
  var pageHarvest = 1.obs;
  RefreshController refreshHarvestController =
      RefreshController(initialRefresh: false);

  void getHarvestRecap() {
    final data = box.read("userData") as Map<String, dynamic>;
    try {
      isLoading(true);
      try {
        PlantProvider()
            .getHarvestRecap(data["id"], pageHarvest.value, data["token"])
            .then((response) {
          // print(response);
          if (response["data"].length != 0) {
            response["data"].map((e) {
              final data = HarvestRecap.fromJson(e as Map<String, dynamic>);
              harvestRecap.add(data);
            }).toList();
            pageHarvest.value = pageHarvest.value + 1;
          } else {}
        });
      } catch (e) {
        dialogError(e.toString());
      }
    } finally {
      isLoading(false);
    }
  }

  void onRefreshHarvest() async {
    harvestRecap.clear();
    await Future.delayed(Duration(milliseconds: 1000));
    pageHarvest.value = 1;
    getHarvestRecap();
    refreshHarvestController.refreshCompleted();
  }

  void addItemHarvest() {
    getHarvestRecap();
  }

  /// data plant for harvest
  var pagePlant = 1.obs;
  var plant = List<PlantForHarvest>.empty().obs;
  RefreshController refreshPlantController =
      RefreshController(initialRefresh: false);
  var isLoading = true.obs;

  void getPlantDataForHarvest() {
    final data = box.read("userData") as Map<String, dynamic>;
    try {
      isLoading(true);
      try {
        PlantProvider()
            .getPlantForHarvest(data["id"], pagePlant.value, data["token"])
            .then((response) {
          // print(response);
          if (response["data"].length != 0) {
            response["data"].map((e) {
              final data = PlantForHarvest.fromJson(e as Map<String, dynamic>);
              plant.add(data);
            }).toList();
            pagePlant.value = pagePlant.value + 1;
          } else {}
        });
      } catch (e) {
        dialogError(e.toString());
      }
    } finally {
      isLoading(false);
    }
  }

  void onRefresPlant() async {
    plant.clear();
    await Future.delayed(Duration(milliseconds: 1000));
    pagePlant.value = 1;
    getPlantDataForHarvest();
    refreshPlantController.refreshCompleted();
  }

  void addItemPlant() {
    getPlantDataForHarvest();
  }

  void runPlantForHarvestage() async {
    getPlantDataForHarvest();

    Get.toNamed(Routes.ADD_PANEN);
  }
}
