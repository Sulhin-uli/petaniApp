import 'dart:async';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:petani_app/app/modules/panen/controllers/panen_controller.dart';
import 'package:petani_app/app/modules/tandur/controllers/tandur_controller.dart';
import 'package:petani_app/app/utils/constant.dart';

class AddHarvestDateView extends GetView<PanenController> {
  @override
  Widget build(BuildContext context) {
    DateTime? dateSelect;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: controller.formGlobalKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Text(
                  "Tanggal Panen",
                  style: TextStyle(
                    color: Color(0xff919A92),
                  ),
                ),
                TextFormField(
                  controller: controller.harvestDate,
                  readOnly: true,
                  cursorColor: const Color(0xff16A085),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101));
                    dateSelect = pickedDate;
                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      controller.harvestDate.text = formattedDate;
                    } else {
                      print("Date is not selected");
                    }
                  },
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
                    suffixIcon: Icon(
                      Icons.date_range_rounded,
                      color: Color(0xff919A92),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Status",
                  style: TextStyle(
                    color: Color(0xff919A92),
                  ),
                ),
                Container(
                  // padding: EdgeInsets.all(16),
                  child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    validator: (value) {
                      // print(value);
                      // dialogError("Tanggal tidak boleh kosong");
                      if (value == "Pilih Status") {
                        return "Kolom belum dipilih";
                      }
                    },
                    // showSelectedItems: true,
                    items: ["Belum Selesai Panen", 'Selesai Panen'],
                    maxHeight: 120,
                    onChanged: (e) {
                      if (e == "Belum Selesai Panen") {
                        controller.status.text = "belum selesai panen";
                      } else if (e == "Selesai Panen") {
                        controller.status.text = "panen";
                      }
                    },
                    dropdownSearchDecoration: const InputDecoration(
                      labelText: "",
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
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
                      // border: border,
                    ),
                    selectedItem: "Pilih Status",
                    dropdownSearchBaseStyle: TextStyle(fontSize: 12),
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
                      onPressed: () {
                        if (controller.formGlobalKey.currentState!.validate()) {
                          controller.isLoading(true);
                          Timer(const Duration(seconds: 3), () {
                            try {
                              // loginController.login(
                              //     controller.email.text, controller.password.text);
                              DateTime dateTimeNow = DateTime.now();

                              String dateNow = DateFormat('yyyy-MM-dd')
                                  .format(DateTime.now());
                              if (dateSelect == null) {
                                dialogError("Tanggal tidak boleh kosong");
                              } else {
                                bool isValidDate =
                                    dateTimeNow.isBefore(dateSelect!);

                                if (isValidDate) {
                                  controller.addHarvestDate(
                                      Get.arguments[0],
                                      Get.arguments[1],
                                      controller.harvestDate.text,
                                      controller.status.text);
                                } else if (dateNow ==
                                    controller.harvestDate.text) {
                                  controller.addHarvestDate(
                                      Get.arguments[0],
                                      Get.arguments[1],
                                      controller.harvestDate.text,
                                      controller.status.text);
                                } else {
                                  dialogError(
                                      "Tanggal yang dipilih tidak boleh mundur dari tanggal sekarang");
                                }
                              }
                            } finally {
                              controller.isLoading(false);
                              controller.harvestDate.clear();
                            }
                          });
                        }
                      },
                      child: Obx(
                        () => controller.isLoading.isTrue
                            ? const CircularProgressIndicator()
                            : const Text('Simpan'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
