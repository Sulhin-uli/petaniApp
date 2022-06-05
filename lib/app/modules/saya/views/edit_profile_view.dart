import 'package:flutter/material.dart';
import 'package:petani_app/app/modules/login/controllers/login_controller.dart';
import 'package:petani_app/app/modules/saya/controllers/saya_controller.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EditProfileView extends GetView<SayaController> {
  final loginC = Get.find<LoginController>();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    final user = box.read("userData") as Map<String, dynamic>;
    final data = loginC.findPoktan(user["id"]);
    controller.city.text = data.city!;
    controller.address.text = data.address!;
    controller.telp.text = data.telp!.toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Edit Akun',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Nama Ketua",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.chairman,
                cursorColor: const Color(0xff16A085),
                decoration: const InputDecoration(
                  // helperText: 'Contoh: Label',
                  // fillColor: Color(0xff919A92),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff919A92),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff16A085),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Kota/Kabupaten",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.city,
                cursorColor: const Color(0xff16A085),
                decoration: const InputDecoration(
                  // helperText: 'Contoh: Label',
                  // fillColor: Color(0xff919A92),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff919A92),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff16A085),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Alamat",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              TextFormField(
                maxLines: 5,
                controller: controller.address,
                cursorColor: const Color(0xff16A085),
                decoration: InputDecoration(
                  // helperText: 'Contoh: Label',
                  // fillColor: Color(0xff919A92),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff919A92),
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff16A085),
                    ),
                  ),
                  fillColor: Colors.grey[100],
                  filled: true,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Telepon",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.telp,
                cursorColor: const Color(0xff16A085),
                decoration: const InputDecoration(
                  // helperText: 'Contoh: Label',
                  // fillColor: Color(0xff919A92),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff919A92),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff16A085),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: SizedBox(
                  height: 46, //height of button
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff16A085), // background
                    ),
                    onPressed: () => controller.editData(
                      controller.chairman.text,
                      controller.city.text,
                      controller.address.text,
                      controller.telp.text,
                    ),
                    child: const Text('Edit'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
