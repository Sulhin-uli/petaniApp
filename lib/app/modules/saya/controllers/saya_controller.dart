import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petani_app/app/data/providers/akun_petani_provider.dart';
import 'package:petani_app/app/data/providers/gapoktan_provider.dart';
import 'package:petani_app/app/data/providers/poktan_provider.dart';
import 'package:petani_app/app/data/providers/user_provider.dart';
import 'package:petani_app/app/modules/login/controllers/login_controller.dart';
import 'package:petani_app/app/utils/base_url.dart';
import 'package:petani_app/app/utils/constant.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SayaController extends GetxController {
  final box = GetStorage();
  late TextEditingController chairman;
  late TextEditingController city;
  late TextEditingController address;
  late TextEditingController telp;
  late TextEditingController passwordCurrent;
  late TextEditingController passwordNew;
  late TextEditingController passwordConfirm;
  var hiddenTextPasswordCurrent = true.obs;
  var hiddenTextPasswordNew = true.obs;
  var hiddenTextPasswordConfirm = true.obs;
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  LoginController loginController = Get.put(LoginController());

  @override
  void onInit() {
    chairman = TextEditingController();
    city = TextEditingController();
    address = TextEditingController();
    telp = TextEditingController();
    passwordCurrent = TextEditingController();
    passwordNew = TextEditingController();
    passwordConfirm = TextEditingController();
    super.onInit();
  }

  void getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value = " Mb";
      updateImage(selectedImagePath.value);
    } else {
      Get.snackbar(
        "Warning",
        "No image Selected",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void updateImage(
    String image,
  ) {
    final data = box.read("userData") as Map<String, dynamic>;
    Map<String, String> body = {"id": data["poktan_id"].toString()};
    AkunPetaniProvider()
        .updateImage(body, image, data["token"])
        .then((response) {
      print(response);
    });
  }

  void editData(
    String chairman,
    String city,
    String address,
    String telp,
  ) {
    final data = box.read("userData") as Map<String, dynamic>;
    var item = loginController.findPoktan(data["id"]);
    AkunPetaniProvider()
        .updateData(
            data["poktan_id"], chairman, city, address, telp, data["token"])
        .then((_) {
      item.city = city;
      item.address = address;
      item.telp = telp;
      loginController.petani.refresh();
      dialog("Berhasil !", "data berhasil diubah");
      Get.back();
    });
  }

  void editPassword(
    String passwordCurrent,
    String passwordNew,
    String passwordConfirm,
  ) {
    final data = box.read("userData") as Map<String, dynamic>;
    if (passwordCurrent != '' && passwordNew != '' && passwordConfirm != '') {
      if (passwordCurrent != data["password"]) {
        dialogNoBack("Terjadi Kesalahan !", "Password saat ini salah");
      } else {
        if (passwordNew == passwordConfirm) {
          final data = box.read("userData") as Map<String, dynamic>;
          UserProvider()
              .updateData(data["id"], passwordNew, data["token"])
              .then((response) {
            final data = box.read("userData") as Map<String, dynamic>;
            box.write('userData', {
              "id": data['id'],
              "token": data["token"],
              "email": data["email"],
              "password": passwordNew,
              "poktan_id": data["poktan_id"],
            });
            Get.back();
            dialog("Berhasil !", "data berhasil diubah");
          });
        } else {
          dialogNoBack("Terjadi Kesalahan !", "Konfirmasi password tidak sama");
        }
      }
    } else {
      dialogNoBack("Terjadi Kesalahan", "Semua Input Harus Diisi");
    }
  }
}
