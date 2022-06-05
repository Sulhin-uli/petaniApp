import 'package:flutter/material.dart';
import 'package:petani_app/app/modules/education/views/item_view.dart';
import 'package:petani_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../controllers/education_controller.dart';

class IndexEducationView extends GetView<EducationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Edukasi',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: Obx(
        () => controller.education.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                        itemCount: controller.education.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) {
                          // final product = productList[index];
                          final data = controller.education[i];
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
        heroTag: 'add',
        // mini: true,
        onPressed: () => Get.toNamed(Routes.ADD_EDUCATION),
        child: const Icon(Icons.add),
      ),
    );
  }
}
