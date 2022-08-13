import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petani_app/app/modules/education/controllers/education_controller.dart';
import 'package:petani_app/app/modules/education/views/item_view.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchEducationView extends GetView<EducationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: Row(
          children: [
            Text("Penacrian : ",
                style: TextStyle(color: Colors.grey, fontSize: 12)),
            Text(Get.arguments,
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
      body: NotificationListener<ScrollEndNotification>(
        onNotification: (scrollEnd) {
          final metrics = scrollEnd.metrics;
          if (metrics.atEdge) {
            bool isTop = metrics.pixels == 0;
            if (isTop) {
              // print('At the top');
            } else {
              // print('At the bottom');
              controller.addItemsSearch();
            }
          }
          return true;
        },
        child: SmartRefresher(
          controller: controller.refreshSearchController,
          onRefresh: controller.onRefreshSearch,
          onLoading: controller.onLoading,
          header: WaterDropMaterialHeader(),
          enablePullDown: true,
          enablePullUp: false,
          child: Obx(
            () => controller.educationSearch.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/empty-data.svg",
                          height: 100,
                          width: 100,
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
                      padding: const EdgeInsets.all(16.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                        itemCount: controller.educationSearch.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) {
                          // final product = productList[index];
                          final data = controller.educationSearch[i];
                          return ItemView(data);
                        },
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
