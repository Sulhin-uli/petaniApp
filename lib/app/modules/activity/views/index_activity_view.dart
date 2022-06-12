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
        title: Obx(() => controller.isSearch.isFalse
            ? Text(
                'Kegiatan',
                style: TextStyle(color: Colors.black, fontSize: 16),
              )
            : TextField(
                controller: controller.seacrh,
                autofocus: true,
                cursorColor: const Color(0xff16A085),
                decoration: InputDecoration(
                  hintText: " Search...",
                  focusColor: Colors.grey,
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      controller.searchActivity.clear();
                      controller.runSearch(controller.seacrh.text);
                      Get.toNamed(Routes.SEARCH_ACTIVITY);
                    },
                  ),
                ),
                style: TextStyle(color: Colors.black, fontSize: 14.0),
              )),
        actions: [
          Obx(
            () => controller.isSearch.isFalse
                ? IconButton(
                    onPressed: () {
                      controller.isSearch(true);
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ))
                : IconButton(
                    onPressed: () {
                      controller.isSearch(false);
                    },
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.grey,
                    ),
                  ),
          )
        ],
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
    );
  }
}
