import 'package:flutter/material.dart';
import 'package:petani_app/app/modules/tandur/views/item_view.dart';

import 'package:get/get.dart';
import 'package:petani_app/app/routes/app_pages.dart';

import '../controllers/tandur_controller.dart';

class IndexTandurView extends GetView<TandurController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Jadwal Tandur',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [
          Obx(() => controller.isMark.isTrue
              ? Row(
                  children: [
                    IconButton(
                      color: Colors.grey,
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        controller.deleteMultiple(context, "tandur");
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        controller.isMark(false);
                      },
                      child: Text(
                        "batal",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                )
              : Container()),
        ],
        elevation: 0.5,
      ),
      body: Obx(() {
        if (controller.isLoading.isTrue) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.isLoading.isFalse) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Column(
                children: [
                  ListView.builder(
                    itemCount: controller.plantTandur.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final data = controller.plantTandur[index];
                      return ItemView(data);
                    },
                  )
                ],
              ),
            ),
          );
        } else
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/empty-data.jpg",
                  height: 250,
                  width: 250,
                ),
                Text(
                  "Data Tidak Ada",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff16A085),
        foregroundColor: Colors.white,
        // mini: true,
        onPressed: () => Get.toNamed(Routes.ADD_TANDUR),
        child: const Icon(Icons.add),
      ),
    );
  }
}
