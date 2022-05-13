import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:petani_app/app/modules/tandur/controllers/tandur_controller.dart';

class EditPanenView extends GetView<TandurController> {
  @override
  Widget build(BuildContext context) {
    final data = controller.findByid(Get.arguments);
    controller.plant_tanaman.text = data.plantTanaman!;
    controller.surface_area.text = data.surfaceArea!;
    String formattedPlatingDate =
        DateFormat('yyyy-MM-dd').format(DateTime.tryParse(data.platingDate!)!);
    String formattedHarvestDate =
        DateFormat('yyyy-MM-dd').format(DateTime.tryParse(data.harvestDate!)!);
    controller.plating_date.text = formattedPlatingDate;
    controller.harvest_date.text = formattedHarvestDate;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Text(
          'Ubah Panen',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Text(
                "Nama Tanaman",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.plant_tanaman,
                cursorColor: Color(0xff16A085),
                decoration: InputDecoration(
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
              const SizedBox(height: 50),
              Text(
                "Luas Tanah",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.surface_area,
                cursorColor: Color(0xff16A085),
                decoration: InputDecoration(
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
              Text(
                "Tanggal Tandur",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.plating_date,
                readOnly: true,
                cursorColor: Color(0xff16A085),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    controller.plating_date.text = formattedDate;
                  } else {
                    print("Date is not selected");
                  }
                },
                decoration: InputDecoration(
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
              Text(
                "Tanggal Panen",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.harvest_date,
                readOnly: true,
                cursorColor: Color(0xff16A085),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    controller.harvest_date.text = formattedDate;
                  } else {
                    print("Date is not selected");
                  }
                },
                decoration: InputDecoration(
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
                      primary: Color(0xff16A085), // background
                    ),
                    onPressed: () => controller.updateData(
                      Get.arguments,
                      controller.plant_tanaman.text,
                      controller.surface_area.text,
                      controller.plating_date.text,
                      controller.harvest_date.text,
                    ),
                    child: Text('Ubah'),
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
