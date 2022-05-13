import 'package:petani_app/app/data/models/farmer_model.dart';
import 'package:petani_app/app/data/models/poktan_model.dart';
import 'package:petani_app/app/data/models/user_model.dart';
import 'package:petani_app/app/data/providers/farmer_provider.dart';
import 'package:petani_app/app/data/providers/login_provider.dart';
import 'package:petani_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthcontrollerController extends GetxController {
  final box = GetStorage();
  var isAuth = false.obs;
  var farmer = List<Farmer>.empty().obs;

  void dialogError(String msg) {
    Get.defaultDialog(title: "Terjadi Kesalahan", middleText: msg);
  }

  void getDataFarmer() async {
    final data = box.read("userData") as Map<String, dynamic>;
    FarmerProvider().getData(data["token"]).then((response) {
      try {
        response["data"].map((e) {
          final data = Farmer(
            id: e["id"],
            userId: User(
              id: e["user_id"]["id"],
              name: e["user_id"]["name"],
            ),
            poktanId: Poktan(
              id: e["poktan_id"]["id"],
              chairman: e["poktan_id"]["chairman"],
            ),
            city: e["city"],
          );
          farmer.add(data);
        }).toList();
        final data = box.read("userData") as Map<String, dynamic>;
        box.write('userData', {
          "id": data['id'],
          "token": data["token"],
          "email": data["email"],
          "password": data["password"],
          "farmer_id": findFarmer(data["id"]).id,
          "poktan_id": findFarmer(data["id"]).poktanId!.id,
        });
        final dataUpdate = box.read("userData") as Map<String, dynamic>;
      } catch (e) {
        print("Error is : " + e.toString());
      }
    });
  }

  // cari id farmer
  Farmer findFarmer(int id) {
    return farmer.firstWhere((e) => e.userId!.id! == id);
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
            getDataFarmer();
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
