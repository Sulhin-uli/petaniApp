import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petani_app/app/modules/panen/controllers/panen_controller.dart';
import 'package:petani_app/app/modules/tandur/controllers/tandur_controller.dart';
import 'package:petani_app/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:petani_app/app/utils/base_url.dart';

class ItemPlantView extends GetView<PanenController> {
  const ItemPlantView(this.data);
  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                data.farmerName!,
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 15),
              const Text(
                "Lahan",
                style: TextStyle(color: Color(0xff919A92), fontSize: 12),
              ),
              const SizedBox(height: 5),
              Text(
                data.fieldCategoryName! +
                    " (" +
                    data.fieldCategoryDetails! +
                    ")",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 15),
              const Text(
                "Tanggal Tandur",
                style: TextStyle(color: Color(0xff919A92), fontSize: 12),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat("EEEE, d MMMM yyyy", "id_ID")
                        .format(data.datePlanting!),
                    style: TextStyle(fontSize: 15),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff16A085), // background
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.ADD_HARVEST_DATE,
                          arguments: [data.id!, data.fieldId]);
                    },
                    child: const Text('Pilih Data'),
                  ),
                ],
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
