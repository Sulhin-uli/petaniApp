import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petani_app/app/modules/home/controllers/home_controller.dart';
import 'package:petani_app/app/modules/login/controllers/login_controller.dart';
import 'package:petani_app/app/routes/app_pages.dart';
import 'package:petani_app/app/utils/base_url.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/saya_controller.dart';

class IndexSayaView extends GetView<SayaController> {
  // final loginC = Get.find<LoginController>();
  // final homeC = Get.find<HomeController>();
  SayaController sayaController = Get.put(SayaController());
  HomeController homeC = Get.put(HomeController());
  LoginController loginC = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final data = loginC.userFarmer.first;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Obx(
                    () => sayaController.selectedImagePath.value.isImageFileName
                        ? Center(
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.all(15),
                                  width: 175,
                                  height: 175,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(200),
                                    child: Image.file(
                                      File(sayaController
                                          .selectedImagePath.value),
                                      height: 150,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 1,
                                  right: 1,
                                  child: InkWell(
                                    onTap: () => sayaController.getImage(),
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      child: const Icon(
                                        Icons.add_a_photo,
                                        color: Colors.white,
                                      ),
                                      decoration: const BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container(),
                  ),
                  Obx(
                    () => loginC.userFarmer.first.farmers!.image != null
                        ? Center(
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.all(15),
                                  width: 175,
                                  height: 175,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(200),
                                    child: Image.network(
                                      baseUrlFile +
                                          "storage/profile/" +
                                          data.farmers!.image!,
                                      height: 150,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 1,
                                  right: 1,
                                  child: InkWell(
                                    onTap: () => sayaController.getImage(),
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      child: const Icon(
                                        Icons.add_a_photo,
                                        color: Colors.white,
                                      ),
                                      decoration: const BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Center(
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.all(15),
                                  width: 175,
                                  height: 175,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(200),
                                    child: Image.asset(
                                      'assets/images/noimage.png',
                                      height: 150,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 1,
                                  right: 1,
                                  child: InkWell(
                                    onTap: () => sayaController.getImage(),
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      child: const Icon(
                                        Icons.add_a_photo,
                                        color: Colors.white,
                                      ),
                                      decoration: const BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    data.farmers!.user!.name!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: Column(
                  children: [
                    const Divider(
                      color: Color(0xff919A92),
                    ),
                    ListTile(
                      leading: Image.asset(
                        "assets/icons/home.png",
                        width: 20,
                        height: 20,
                      ),
                      title: const Text('Kembali Ke Home'),
                      onTap: () {
                        homeC.changeTabIndex(0);
                      },
                    ),
                    const Divider(
                      color: Color(0xff919A92),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 16,
                ),
                child: const Text(
                  "Aktivitas Saya",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () => Get.toNamed(Routes.INDEX_EDUCATION),
                leading: Image.asset(
                  "assets/icons/kegiatan.png",
                  width: 20,
                  height: 20,
                ),
                title: const Text('Edukasi'),
              ),
              ListTile(
                onTap: () => Get.toNamed(Routes.INDEX_ACTIVITY),
                leading: Image.asset(
                  "assets/icons/edukasi.png",
                  width: 20,
                  height: 20,
                ),
                title: const Text('Kegiatan'),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 16,
                ),
                child: const Text(
                  "Pengaturan Akun",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () => Get.toNamed(Routes.INFORMATION_ACCOUNT),
                leading: Icon(
                  Icons.person,
                  size: 20,
                  color: Colors.blue,
                ),
                title: const Text('Informasi Akun'),
              ),
              // ListTile(
              //   onTap: () => Get.toNamed(Routes.EDIT_PROFILE),
              //   leading: Image.asset(
              //     "assets/icons/edit-akun.png",
              //     width: 20,
              //     height: 20,
              //   ),
              //   title: const Text('Ubah Akun'),
              // ),
              ListTile(
                onTap: () => Get.toNamed(Routes.EDIT_PASSWORD),
                leading: Image.asset(
                  "assets/icons/edit-password.png",
                  width: 20,
                  height: 20,
                ),
                title: const Text('Ubah Password'),
              ),
              GestureDetector(
                onTap: () {
                  controller.dialogLogout(context);
                },
                child: ListTile(
                  leading: Image.asset(
                    "assets/icons/logout.png",
                    width: 20,
                    height: 20,
                  ),
                  title: Text('Logout'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
