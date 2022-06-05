import 'package:flutter/material.dart';
import 'package:petani_app/app/modules/activity/views/item_activity_view.dart';
import 'package:petani_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/activity_controller.dart';

class IndexActivityView extends GetView<ActivityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Kegiatan',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: Obx(
        () => controller.activity.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Column(
                    children: [
                      ListView.builder(
                        itemCount: controller.activity.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) {
                          // final product = productList[index];
                          final data = controller.activity[i];
                          return ItemActivityView(data);
                        },
                      )
                    ],
                  ),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff16A085),
        foregroundColor: Colors.white,
        // mini: true,
        onPressed: () => Get.toNamed(Routes.ADD_ACTIVITY),
        child: const Icon(Icons.add),
      ),
    );
  }
}
