import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:petani_app/app/data/models/farmer_model.dart';
import 'package:petani_app/app/data/models/plant_model.dart';
import 'package:petani_app/app/data/models/poktan_model.dart';
import 'package:petani_app/app/data/models/user_model.dart';
import 'package:petani_app/app/data/providers/farmer_provider.dart';
import 'package:petani_app/app/data/providers/plant_provider.dart';
import 'package:petani_app/app/utils/constant.dart';

class TandurController extends GetxController {
  final box = GetStorage();
  var plant = List<Plant>.empty().obs;
  var farmer = List<Farmer>.empty().obs;
  late TextEditingController plant_tanaman;
  late TextEditingController surface_area;
  late TextEditingController plating_date;
  late TextEditingController harvest_date;

  void onInit() {
    getDataByid();
    plant_tanaman = TextEditingController();
    surface_area = TextEditingController();
    plating_date = TextEditingController();
    harvest_date = TextEditingController();
    super.onInit();
  }

  // add data
  void postData(
    String plant_tanaman,
    String surface_area,
    String plating_date,
  ) async {
    if (plant_tanaman != '' &&
        surface_area != '' &&
        plating_date != '' &&
        harvest_date != '') {
      final data = box.read("userData") as Map<String, dynamic>;
      // var farmer_id = findFarmer(data["id"]).id!;
      // var poktan_id = findFarmer(data["id"]).poktanId!.id!;
      PlantProvider()
          .postData(data["farmer_id"], data["poktan_id"], plant_tanaman,
              surface_area, plating_date, null, data["token"])
          .then((response) {
        // print(response);
        final data = Plant(
          id: response["data"]["id"],
          farmerId: Farmer(
            id: response["data"]["farmer_id"]["id"],
            userId: User(
              id: response["data"]["farmer_id"]["user_id"]["id"],
              name: response["data"]["farmer_id"]["user_id"]["name"],
            ),
            city: response["data"]["farmer_id"]["city"],
          ),
          poktanId: Poktan(
            id: response["data"]["farmer_id"]["poktan_id"]["id"],
            chairman: response["data"]["farmer_id"]["poktan_id"]["chairman"],
          ),
          plantTanaman: response["data"]["plant_tanaman"],
          surfaceArea: response["data"]["surface_area"],
          platingDate: response["data"]["plating_date"],
          harvestDate: response["data"]["harvest_date"],
          createdAt: response["data"]["created_at"],
          updatedAt: response["data"]["updated_at"],
        );
        plant.insert(0, data);
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
        .getDataById(data["farmer_id"], data["token"])
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
              chairman: e["farmer_id"]["poktan_id"]["chairman"],
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

  // cari berdasarka id
  Plant findByid(int id) {
    return plant.firstWhere((element) => element.id == id);
  }

  void updateData(
    int id,
    String plant_tanaman,
    String surface_area,
    String plating_date,
  ) {
    final data = box.read("userData") as Map<String, dynamic>;
    final item = findByid(id);
    PlantProvider()
        .updateData(
            id, plant_tanaman, surface_area, plating_date, data["token"])
        .then((e) {
      item.plantTanaman = plant_tanaman;
      item.surfaceArea = surface_area;
      item.platingDate = plating_date;
      plant.refresh();
      Get.back();
      dialog("Berhasil !", "data berhasil diubah!");
    });
  }

  void delete(int id) {
    final data = box.read("userData") as Map<String, dynamic>;
    PlantProvider()
        .deleteData(id, data["token"])
        .then((_) => plant.removeWhere((element) => element.id == id));
    dialog("Berhasil !", "data berhasil dihapus!");
  }

  void dialogDelete(BuildContext context, int id) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Hapus"),
        content: Text("Yakin menghapus data?"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Batal'),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Ya');
              delete(id);
            },
            child: Text('Ya'),
          ),
        ],
      ),
    );
  }
}
