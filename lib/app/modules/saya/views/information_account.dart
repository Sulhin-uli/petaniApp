import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:petani_app/app/modules/login/controllers/login_controller.dart';
import 'package:petani_app/app/modules/saya/controllers/saya_controller.dart';

class InformationAccountView extends GetView<SayaController> {
  final loginC = Get.find<LoginController>();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    final data = loginC.userFarmer.first;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Informasi Akun',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 3,
            child: Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Nama Petani",
                    style: TextStyle(color: Color(0xff919A92), fontSize: 12),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    data.farmers!.user!.name!,
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Kota/Kabupaten",
                    style: TextStyle(color: Color(0xff919A92), fontSize: 12),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    data.farmers!.city!,
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Alamat",
                    style: TextStyle(color: Color(0xff919A92), fontSize: 12),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    data.farmers!.address!,
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Telepon",
                    style: TextStyle(color: Color(0xff919A92), fontSize: 12),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    data.farmers!.telp.toString(),
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
