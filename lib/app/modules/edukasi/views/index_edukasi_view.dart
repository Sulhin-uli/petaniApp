import 'package:flutter/material.dart';
import 'package:petani_app/app/modules/edukasi/views/item_view.dart';
import 'package:petani_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/edukasi_controller.dart';

class IndexEdukasiView extends GetView<EdukasiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xff5D8BF4),
      //   elevation: 0,
      // ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 1.2),
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
