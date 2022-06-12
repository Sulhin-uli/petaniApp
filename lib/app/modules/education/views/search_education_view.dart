import 'package:flutter/material.dart';
import 'package:petani_app/app/modules/education/views/item_view.dart';
import 'package:petani_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../controllers/education_controller.dart';

class SearchEducationView extends GetView<EducationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: Row(
          children: [
            Text("Hasil : ",
                style: TextStyle(color: Colors.grey, fontSize: 12)),
            Text(controller.seacrh.text,
                style: TextStyle(color: Colors.black, fontSize: 12)),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.cancel,
              color: Colors.grey,
            ),
          ),
        ],
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: Obx(
        () => controller.searchEducation.isEmpty
            ? Center(
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
                        itemCount: controller.searchEducation.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) {
                          // final product = productList[index];
                          final data = controller.searchEducation[i];
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
