import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petani_app/app/modules/tandur/controllers/tandur_controller.dart';
import 'package:petani_app/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:petani_app/app/utils/base_url.dart';

class ItemView extends GetView<TandurController> {
  const ItemView(this.data);
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
                "Tanggal Panen",
                style: TextStyle(color: Color(0xff919A92), fontSize: 12),
              ),
              const SizedBox(height: 5),
              Text(
                DateFormat("EEEE, d MMMM yyyy", "id_ID")
                    .format(data.dateHarvest!),
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 15),
              const Text(
                "Status",
                style: TextStyle(color: Color(0xff919A92), fontSize: 12),
              ),
              const SizedBox(height: 5),
              (data.status! == "belum selesai panen")
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.status! == "belum selesai panen"
                              ? "Belum selesai panen"
                              : "Panen selesai",
                          style: TextStyle(fontSize: 15),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff16A085), // background
                          ),
                          onPressed: () {
                            Get.toNamed(Routes.EDIT_PANEN, arguments: data.id!);
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    )
                  : Text(
                      data.status! == "belum selesai panen"
                          ? "Belum selesai panen"
                          : "Panen selesai",
                      style: TextStyle(fontSize: 15),
                    ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
