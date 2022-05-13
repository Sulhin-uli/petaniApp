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
        leading: BackButton(color: Colors.black),
        title: Text(
          'Jadwal Tandur',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0.5,
      ),
      body: Obx(
        () => controller.plant.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Column(
                    children: [
                      ListView.builder(
                        itemCount: controller.plant.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final data = controller.plant[index];
                          return ItemView(data);
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
        onPressed: () => Get.toNamed(Routes.ADD_TANDUR),
        child: Icon(Icons.add),
      ),
    );
  }
}
