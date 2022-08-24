import 'package:flutter/cupertino.dart';
import 'package:form_field_validator/form_field_validator.dart';
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
    harvestDate = TextEditingController();
    status = TextEditingController();
    getHarvestRecap();
    super.onInit();
  }

  final box = GetStorage();
  final formGlobalKey = GlobalKey<FormState>();
  final statusValidator = MultiValidator([
    RequiredValidator(errorText: 'kolom tidak boleh kosong'),
  ]);

  /// Harvest
  var harvestRecap = List<HarvestRecap>.empty().obs;
  var pageHarvest = 1.obs;
  RefreshController refreshHarvestController =
      RefreshController(initialRefresh: false);
  // cari berdasarka id
  HarvestRecap findById(int id) {
    return harvestRecap.firstWhere((element) => element.id == id);
  }

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

  // add date panen
  late TextEditingController harvestDate;
  late TextEditingController status;

  void addHarvestDate(
      int plantId, int fieldId, String harvestDate, String status) async {
    if (harvestDate != '') {
      await Future.delayed(Duration(milliseconds: 1000));
      try {
        final data = box.read("userData") as Map<String, dynamic>;

        PlantProvider()
            .storeHarvest(data["petani_id"], plantId, fieldId, status,
                harvestDate, data["token"])
            .then((response) {
          print(response);
        });
      } catch (e) {
        dialogError(e.toString());
      }
      onRefreshHarvest();
      onRefresPlant();
      Get.back();
      dialogSuccess("Data Berhasil Ditambahkan");
    } else {
      dialogError("Tanggal Belum Diisi");
    }
  }

  void updateHarvestDate(int id, int plantId, int fieldId, String harvestDate,
      String status) async {
    await Future.delayed(Duration(milliseconds: 1000));
    try {
      final data = box.read("userData") as Map<String, dynamic>;

      PlantProvider()
          .updateHarvest(id, data["petani_id"], plantId, fieldId, status,
              harvestDate, data["token"])
          .then((response) {
        print(response);
      });
    } catch (e) {
      dialogError(e.toString());
    }
    onRefreshHarvest();
    onRefresPlant();
    Get.back();
    dialogSuccess("Data Berhasil Ditambahkan");
  }
}
