import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:petani_app/app/data/models/farmer_model.dart';
import 'package:petani_app/app/data/models/field_model.dart';
import 'package:petani_app/app/data/models/plant_model.dart';
import 'package:petani_app/app/data/models/plant_recap_model.dart';
import 'package:petani_app/app/data/models/poktan_model.dart';
import 'package:petani_app/app/data/models/user_model.dart';
import 'package:petani_app/app/data/providers/plant_provider.dart';
import 'package:petani_app/app/routes/app_pages.dart';
import 'package:petani_app/app/utils/base_url.dart';
import 'package:petani_app/app/utils/constant.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TandurController extends GetxController {
  final box = GetStorage();
  var plantTandur = List<Plant>.empty().obs;
  var plantPanen = List<Plant>.empty().obs;
  var plantAll = List<Plant>.empty().obs;
  var plant = List<Plant>.empty().obs;
  var farmer = List<Farmer>.empty().obs;
  late TextEditingController plant_tanaman;
  late TextEditingController surface_area;
  late TextEditingController address;
  late TextEditingController plating_date;
  late TextEditingController harvest_date;
  var isLoading = true.obs;
  var isMark = false.obs;
  var itemId = List<int>.empty().obs;

  @override
  void onInit() {
    getPlantRecap();
    // getField();
    // getDataByid();
    // getDataTandur();
    // getDataPanen();
    // getData();
    plant_tanaman = TextEditingController();
    surface_area = TextEditingController();
    address = TextEditingController();
    plating_date = TextEditingController();
    harvest_date = TextEditingController();
    super.onInit();
  }

//////////////////// new //////////////////////////////
///// tandur
  var plantRecap = List<PlantRecap>.empty().obs;
  var pagePlant = 1.obs;
  RefreshController refreshPlantController =
      RefreshController(initialRefresh: false);

  void getPlantRecap() {
    final data = box.read("userData") as Map<String, dynamic>;
    try {
      isLoading(true);
      try {
        PlantProvider()
            .getPlantRecap(data["id"], pagePlant.value, data["token"])
            .then((response) {
          // print(response);
          if (response["data"].length != 0) {
            response["data"].map((e) {
              final data = PlantRecap.fromJson(e as Map<String, dynamic>);
              plantRecap.add(data);
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
    plantRecap.clear();
    await Future.delayed(Duration(milliseconds: 1000));
    pagePlant.value = 1;
    getPlantRecap();
    refreshPlantController.refreshCompleted();
  }

  void addItemPlant() {
    getPlantRecap();
  }

  // field
  var field = List<Field>.empty().obs;
  var pageField = 1.obs;
  RefreshController refreshFieldController =
      RefreshController(initialRefresh: false);

  void getField() {
    final data = box.read("userData") as Map<String, dynamic>;
    try {
      isLoading(true);
      try {
        PlantProvider()
            .getField(data["petani_id"], pageField.value, data["token"])
            .then((response) {
          if (response["data"].length != 0) {
            response["data"].map((e) {
              final data = Field.fromJson(e as Map<String, dynamic>);
              field.add(data);
            }).toList();
            pageField.value = pageField.value + 1;
          } else {}
        });
      } catch (e) {
        dialogError(e.toString());
      }
    } finally {
      isLoading(false);
    }
  }

  void onRefresField() async {
    field.clear();
    await Future.delayed(Duration(milliseconds: 1000));
    pageField.value = 1;
    getField();
    refreshFieldController.refreshCompleted();
  }

  void onLoad() async {}

  void addItemField() async {
    getField();
  }

  void runFieldPage() async {
    getField();
    Get.toNamed(Routes.ADD_TANDUR);
  }

  void addPlantDate(int fieldId, String platingDate) async {
    await Future.delayed(Duration(milliseconds: 1000));
    try {
      final data = box.read("userData") as Map<String, dynamic>;

      PlantProvider()
          .storePlant(data["petani_id"], fieldId, platingDate, data["token"])
          .then((response) {});
    } catch (e) {
      dialogError(e.toString());
    }
    onRefresField();
    onRefresPlant();
    Get.back();
    dialogSuccess("Data Berhasil Ditambahkan");
  }

//////////////////// old //////////////////////////////
  // add data
  void postData(
    String plantTanaman,
    String surfaceArea,
    String address,
    String platingDate,
  ) async {
    if (plantTanaman != '' &&
        surfaceArea != '' &&
        address != '' &&
        platingDate != '' &&
        harvest_date != '') {
      final data = box.read("userData") as Map<String, dynamic>;

      PlantProvider()
          .postData(data["petani_id"], data["poktan_id"], plantTanaman,
              surfaceArea, address, platingDate, null, data["token"])
          .then((response) {
        // print(response);
        final data = Plant(
          id: response["data"]["id"],
          farmerId: Farmer(
            id: response["data"]["farmer_id"]["id"],
            image: response["data"]["farmer_id"]["image"],
            userId: User(
              id: response["data"]["farmer_id"]["user_id"]["id"],
              name: response["data"]["farmer_id"]["user_id"]["name"],
            ),
            city: response["data"]["farmer_id"]["city"],
          ),
          poktanId: Poktan(
            id: response["data"]["farmer_id"]["poktan_id"]["id"],
          ),
          plantTanaman: response["data"]["plant_tanaman"],
          surfaceArea: response["data"]["surface_area"],
          address: response["data"]["address"],
          platingDate: response["data"]["plating_date"],
          isMark: false,
          createdAt: response["data"]["created_at"],
          updatedAt: response["data"]["updated_at"],
        );
        plantTandur.insert(0, data);
        Get.back();
        dialog("Berhasil !", "data berhasil ditambahkan!");
      });
    } else {
      dialog("Terjadi Kesalahan", "Semua Input Harus Diisi");
    }
  }

  Future getDataByid() async {
    final data = box.read("userData") as Map<String, dynamic>;
    return PlantProvider()
        .getDataById(data["petani_id"], data["token"])
        .then((response) {
      try {
        response["data"].map((e) {
          final data = Plant(
            id: e["id"],
            farmerId: Farmer(
              id: e["farmer_id"]["id"],
              userId: User(
                id: e["farmer_id"]["user_id"]["id"],
                name: e["farmer_id"]["user_id"]["name"],
              ),
              city: e["farmer_id"]["city"],
            ),
            poktanId: Poktan(
              id: e["farmer_id"]["poktan_id"]["id"],
            ),
            plantTanaman: e["plant_tanaman"],
            surfaceArea: e["surface_area"],
            platingDate: e["plating_date"],
            harvestDate: e["harvest_date"],
            createdAt: e["created_at"],
            updatedAt: e["updated_at"],
          );
          plant.add(data);
        }).toList();
      } catch (e) {
        print("Error is : " + e.toString());
      }
    });
  }

  Future getDataTandur() async {
    try {
      isLoading(true);
      final data = box.read("userData") as Map<String, dynamic>;
      return PlantProvider().getData(data["token"]).then((response) {
        try {
          // response["data"].map((e) {
          //   if (e["farmer_id"]["id"] == data["petani_id"]) {
          //     if (e["status"] == "tandur") {
          //       final data = Plant(
          //         id: e["id"],
          //         farmerId: Farmer(
          //           id: e["farmer_id"]["id"],
          //           userId: User(
          //             id: e["farmer_id"]["user_id"]["id"],
          //             name: e["farmer_id"]["user_id"]["name"],
          //           ),
          //           city: e["farmer_id"]["city"],
          //           image: e["farmer_id"]["image"],
          //         ),
          //         poktanId: Poktan(
          //           id: e["farmer_id"]["poktan_id"]["id"],
          //         ),
          //         plantTanaman: e["plant_tanaman"],
          //         surfaceArea: e["surface_area"],
          //         address: e["address"],
          //         platingDate: e["plating_date"],
          //         harvestDate: e["harvest_date"],
          //         isMark: false,
          //         createdAt: e["created_at"],
          //         updatedAt: e["updated_at"],
          //       );
          //       plantTandur.add(data);
          //     }
          //   }
          // }).toList();
        } catch (e) {
          print("Error is : " + e.toString());
        }
      });
    } finally {
      isLoading(false);
    }
  }

  Future getDataPanen() async {
    final data = box.read("userData") as Map<String, dynamic>;
    return PlantProvider().getData(data["token"]).then((response) {
      try {
        response["data"].map((e) {
          if (e["farmer_id"]["id"] == data["petani_id"]) {
            if (e["status"] == "panen") {
              final data = Plant(
                id: e["id"],
                farmerId: Farmer(
                  id: e["farmer_id"]["id"],
                  userId: User(
                    id: e["farmer_id"]["user_id"]["id"],
                    name: e["farmer_id"]["user_id"]["name"],
                  ),
                  city: e["farmer_id"]["city"],
                  image: e["farmer_id"]["image"],
                ),
                poktanId: Poktan(
                  id: e["farmer_id"]["poktan_id"]["id"],
                ),
                plantTanaman: e["plant_tanaman"],
                surfaceArea: e["surface_area"],
                address: e["address"],
                platingDate: e["plating_date"],
                harvestDate: e["harvest_date"],
                isMark: false,
                createdAt: e["created_at"],
                updatedAt: e["updated_at"],
              );
              plantPanen.add(data);
            }
          }
        }).toList();
      } catch (e) {
        print("Error is : " + e.toString());
      }
    });
  }

  Future getDataOld() async {
    final data = box.read("userData") as Map<String, dynamic>;
    return PlantProvider().getData(data["token"]).then((response) {
      try {
        response["data"].map((e) {
          if (e["farmer_id"]["id"] == data["petani_id"]) {
            if (e["status"] == "selesai") {
              final data = Plant(
                id: e["id"],
                farmerId: Farmer(
                  id: e["farmer_id"]["id"],
                  userId: User(
                    id: e["farmer_id"]["user_id"]["id"],
                    name: e["farmer_id"]["user_id"]["name"],
                  ),
                  city: e["farmer_id"]["city"],
                  image: e["farmer_id"]["image"],
                ),
                poktanId: Poktan(
                  id: e["farmer_id"]["poktan_id"]["id"],
                ),
                plantTanaman: e["plant_tanaman"],
                surfaceArea: e["surface_area"],
                address: e["address"],
                platingDate: e["plating_date"],
                harvestDate: e["harvest_date"],
                isMark: false,
                createdAt: e["created_at"],
                updatedAt: e["updated_at"],
              );
              plantAll.add(data);
            }
          }
        }).toList();
      } catch (e) {
        print("Error is : " + e.toString());
      }
    });
  }

  // cari berdasarka id
  Plant findByTandur(int id) {
    return plantTandur.firstWhere((element) => element.id == id);
  }

  Plant findByPanen(int id) {
    return plantPanen.firstWhere((element) => element.id == id);
  }

  Plant findBySelesai(int id) {
    return plantAll.firstWhere((element) => element.id == id);
  }

  // cari berdasarka id
  Plant findByid(int id) {
    return plant.firstWhere((element) => element.id == id);
  }

  void updateData(int id, String plantTanaman, String surfaceArea,
      String address, String platingDate, String status,
      [var harvestDate]) {
    final data = box.read("userData") as Map<String, dynamic>;
    final item = status == "tandur" ? findByTandur(id) : findByPanen(id);

    PlantProvider()
        .updateData(
      id,
      plantTanaman,
      surfaceArea,
      platingDate,
      address,
      harvestDate,
      data["token"],
    )
        .then((response) {
      // print(response);
      item.plantTanaman = plantTanaman;
      item.surfaceArea = surfaceArea;
      item.address = address;
      item.platingDate = platingDate;
      item.harvestDate = harvestDate;
      if (status == "tandur") {
        plantTandur.refresh();
      } else if (status == "panen") {
        plantPanen.refresh();
      }
      Get.back();
      dialog("Berhasil !", "data berhasil diubah!");
    });
  }

  void delete(int id, String status) {
    final data = box.read("userData") as Map<String, dynamic>;
    if (status == "tandur") {
      PlantProvider()
          .deleteData(id, data["token"])
          .then((_) => plantTandur.removeWhere((element) => element.id == id));
    } else if (status == "panen") {
      PlantProvider()
          .deleteData(id, data["token"])
          .then((_) => plantPanen.removeWhere((element) => element.id == id));
    } else if (status == "selesai") {
      PlantProvider()
          .deleteData(id, data["token"])
          .then((_) => plantAll.removeWhere((element) => element.id == id));
    }
    dialog("Berhasil !", "data berhasil dihapus!");
  }

  void dialogDelete(BuildContext context, int id, String status) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text("Hapus"),
        content: const Text("Yakin menghapus data?"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Batal'),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Ya');
              delete(id, status);
            },
            child: const Text('Ya'),
          ),
        ],
      ),
    );
  }

  void deleteMultiple(BuildContext context, String status) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text("Hapus"),
        content: const Text("Yakin menghapus data?"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Batal'),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Ya');
              final data = box.read("userData") as Map<String, dynamic>;
              for (var id in itemId) {
                if (status == "tandur") {
                  PlantProvider().deleteData(id, data["token"]).then((_) =>
                      plantTandur.removeWhere((element) => element.id == id));
                } else if (status == "panen") {
                  PlantProvider().deleteData(id, data["token"]).then((_) =>
                      plantPanen.removeWhere((element) => element.id == id));
                } else if (status == "selesai") {
                  PlantProvider().deleteData(id, data["token"]).then((_) =>
                      plantAll.removeWhere((element) => element.id == id));
                }
              }
              dialog("Berhasil !", "data berhasil dihapus!");
              isMark(false);
            },
            child: const Text('Ya'),
          ),
        ],
      ),
    );
  }

  void addHarvestDate(
    int id,
    String harvetsDate,
  ) {
    final data = box.read("userData") as Map<String, dynamic>;
    plantTandur.removeWhere((element) => element.id == id);
    PlantProvider().addHarvestDate(id, harvetsDate, data["token"]).then((e) {
      Get.back();
      Get.back();
      dialog("Berhasil !", "data berhasil ditambahkan ke data panen!");
    });
  }

  void dialogSelesai(
    BuildContext context,
    int id,
  ) {
    final data = box.read("userData") as Map<String, dynamic>;
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text("Panen"),
        content: const Text("Panen selesai?"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Batal'),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Ya');
              PlantProvider().updateStatus(id, data["token"]).then(
                  (_) => plantPanen.removeWhere((element) => element.id == id));

              Get.back();
              dialog("Berhasil !", "data panen selesai!");
            },
            child: const Text('Ya'),
          ),
        ],
      ),
    );
  }
}
