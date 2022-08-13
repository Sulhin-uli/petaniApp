import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:petani_app/app/modules/tandur/controllers/tandur_controller.dart';
import 'package:petani_app/app/utils/constant.dart';

class AddDateTandurView extends GetView<TandurController> {
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text(
                "Tanggal Tandur",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.plating_date,
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
                    controller.plating_date.text = formattedDate;
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
              Center(
                child: SizedBox(
                  height: 46, //height of button
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff16A085), // background
                    ),
                    onPressed: () {
                      // if (controller.formGlobalKey.currentState!.validate()) {
                      controller.isLoading(true);
                      Timer(const Duration(seconds: 3), () {
                        try {
                          // loginController.login(
                          //     controller.email.text, controller.password.text);
                          // controller.addPlantDate(
                          //     Get.arguments, controller.plating_date.text);
                          DateTime dateTimeNow = DateTime.now();

                          String dateNow =
                              DateFormat('yyyy-MM-dd').format(DateTime.now());
                          if (dateSelect == null) {
                            dialogError("Tanggal tidak boleh kosong");
                          } else {
                            bool isValidDate =
                                dateTimeNow.isBefore(dateSelect!);

                            if (isValidDate) {
                              controller.addPlantDate(
                                  Get.arguments, controller.plating_date.text);
                            } else if (dateNow ==
                                controller.plating_date.text) {
                              controller.addPlantDate(
                                  Get.arguments, controller.plating_date.text);
                            } else {
                              dialogError(
                                  "Tanggal yang dipilih tidak boleh mundur dari tanggal sekarang");
                            }
                          }

                          // print(dateNow == controller.plating_date.text);

                        } finally {
                          controller.plating_date.clear();
                          controller.isLoading(false);
                        }
                      });
                      // }
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
    );
  }
}
