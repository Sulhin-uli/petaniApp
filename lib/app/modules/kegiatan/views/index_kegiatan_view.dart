import 'package:flutter/material.dart';
import 'package:petani_app/app/modules/kegiatan/views/item_view.dart';
import 'package:petani_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/kegiatan_controller.dart';

class IndexKegiatanView extends GetView<KegiatanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            children: [
              ListView.builder(
                itemCount: 11,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  // final product = productList[index];
                  return ItemView();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
