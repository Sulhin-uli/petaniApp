import 'package:flutter/material.dart';
import 'package:petani_app/app/data/models/farmer_model.dart';
import 'package:petani_app/app/data/models/poktan_model.dart';
import 'package:petani_app/app/data/models/user_farmer_model.dart';
import 'package:petani_app/app/data/models/user_model.dart';
import 'package:petani_app/app/data/providers/farmer_provider.dart';
import 'package:petani_app/app/data/providers/login_provider.dart';
import 'package:petani_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:petani_app/app/utils/constant.dart';

class LoginController extends GetxController {
  final box = GetStorage();
  var isAuth = false.obs;
  var petani = List<Farmer>.empty().obs;
  var userFarmer = List<UserFarmerModel>.empty().obs;
  late TextEditingController email;
  late TextEditingController password;
  var hiddenTextPassword = true.obs;
  final formGlobalKey = GlobalKey<FormState>();
  var isLoading = false.obs;

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'kolom tidak boleh kosong'),
    MinLengthValidator(6, errorText: 'Minimal 6 karakter'),
    MaxLengthValidator(50, errorText: 'Maksimal 50 karakter'),
  ]);
  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'kolom tidak boleh kosong'),
    PatternValidator(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        errorText: 'Email tidak valid'),
    MaxLengthValidator(100, errorText: 'Maksimal 100 karakter'),
  ]);

  @override
  void onInit() {
    super.onInit();
    autoLogin();
    email = TextEditingController();
    password = TextEditingController();
  }

  Future<void> autoLogin() async {
    if (box.read("userData") != null) {
      final data = box.read("userData") as Map<String, dynamic>;
      login(data["email"], data["password"]);
    } else {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.offAllNamed(Routes.LOGIN);
      });
    }
  }

  void login(String email, String password) async {
    // LoginProvider().login(email, password).then(
    //   (response) {
    //     if (email != '' && password != '') {
    //       if (response['success'] == true) {
    // box.write('userData', {
    //   "id": response['data']['id'],
    //   "token": response['data']['token'],
    //   "email": email,
    //   "password": password
    // });
    // // isAuth(true);
    // isAuth.value = true;
    // box.write('isAuth', true);
    // // getDataPetani();
    // Get.offAllNamed(Routes.HOME);
    //       } else {
    //         Get.offAllNamed(Routes.LOGIN);
    //         dialogError('Akun tidak ditemukan');
    //       }
    //     } else {
    //       dialogError('Semua data input harus di isi');
    //     }
    //   },
    // );
    try {
      LoginProvider().login(email, password).then(
        (response) {
          if (response["status"] != 200) {
            dialogError(response['messages']);
          } else {
            // try {
            final data = UserFarmerModel.fromJson(
                response["data"] as Map<String, dynamic>);
            userFarmer.add(data);
            box.write('userData', {
              "id": response['data']['farmers']['user']['id'],
              "token": response['data']['token'],
              "email": email,
              "password": password,
              "petani_id": response['data']['farmers']['id'],
            });
            // isAuth(true);
            isAuth.value = true;
            box.write('isAuth', true);
            Get.offAllNamed(Routes.HOME);
            Get.defaultDialog(
              title: "Info",
              titleStyle: TextStyle(fontSize: 12),
              content: Text(
                response['messages'],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            );
            // } catch (e) {
            //   // dialogError("Login Gagal" + e.toString());
            //   dialogError("Login Gagal");
            // }
          }
        },
      );
    } catch (e) {}
  }

  // void getDataPetani() async {
  //   final data = box.read("userData") as Map<String, dynamic>;
  //   FarmerProvider().getData(data["token"]).then((response) {
  //     try {
  //       response["data"].map((e) {
  //         final data = Farmer(
  //           id: e["id"],
  //           userId: User(
  //             id: e["user_id"]["id"],
  //             name: e["user_id"]["name"],
  //           ),
  //           poktanId: Poktan(
  //             id: e["poktan_id"]["id"],
  //             userId: User(
  //               id: e["poktan_id"]["user_id"]["id"],
  //               name: e["poktan_id"]["user_id"]["name"],
  //             ),
  //           ),
  //           city: e["city"],
  //           address: e["address"],
  //           telp: e["telp"].toString(),
  //           image: e["image"],
  //         );
  //         petani.add(data);
  //       }).toList();
  //       final data = box.read("userData") as Map<String, dynamic>;
  //       box.write('userData', {
  //         "id": data['id'],
  //         "token": data["token"],
  //         "email": data["email"],
  //         "password": data["password"],
  //         "petani_id": findPetani(data["id"]).id,
  //         "poktan_id": findPetani(data["id"]).poktanId!.id,
  //       });
  //     } catch (e) {
  //       print("Error is a : " + e.toString());
  //     }
  //   });
  // }

  Farmer findPetani(int id) {
    return petani.firstWhere((e) => e.userId!.id! == id);
  }
}
