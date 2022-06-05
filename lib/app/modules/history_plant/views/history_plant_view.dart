import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petani_app/app/modules/history_plant/views/item_view.dart';
import 'package:petani_app/app/modules/tandur/controllers/tandur_controller.dart';

class HistoryPlantView extends GetView<TandurController> {
  @override
  Widget build(BuildContext context) {
    // print(controller.plantAll.length);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Riwayat Penanaman',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0.5,
      ),
      body: Obx(
        () => controller.plantAll.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Column(
                    children: [
                      ListView.builder(
                        itemCount: controller.plantAll.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final data = controller.plantAll[index];
                          return ItemView(data);
                        },
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
