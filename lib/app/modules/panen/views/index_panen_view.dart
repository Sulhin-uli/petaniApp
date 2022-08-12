import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petani_app/app/modules/panen/controllers/panen_controller.dart';
import 'package:petani_app/app/modules/tandur/views/item_view.dart';

import 'package:get/get.dart';
import 'package:petani_app/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class IndexPanenView extends GetView<PanenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Panen',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [
          TextButton(
              onPressed: () {
                controller.runPlantForHarvestage();
                // Get.toNamed(Routes.ADD_TANDUR);
              },
              child: const Text(
                "Tambah Panen",
                style: TextStyle(color: Color(0xff16A085), fontSize: 16),
              ))
        ],
        // actions: [
        //   Obx(() => controller.isMark.isTrue
        //       ? Row(
        //           children: [
        //             IconButton(
        //               color: Colors.grey,
        //               icon: Icon(Icons.delete),
        //               onPressed: () {
        //                 controller.deleteMultiple(context, "tandur");
        //               },
        //             ),
        //             TextButton(
        //               onPressed: () {
        //                 controller.isMark(false);
        //               },
        //               child: Text(
        //                 "batal",
        //                 style: TextStyle(color: Colors.grey),
        //               ),
        //             ),
        //           ],
        //         )
        //       : Container()),
        // ],
        elevation: 0.5,
      ),
      body: NotificationListener<ScrollEndNotification>(
        onNotification: (scrollEnd) {
          final metrics = scrollEnd.metrics;
          if (metrics.atEdge) {
            bool isTop = metrics.pixels == 0;
            if (isTop) {
              // print('At the top');
            } else {
              // print('At the bottom');
              // controller.addItemPlant();
            }
          }
          return true;
        },
        child: SmartRefresher(
          controller: controller.refreshHarvestController,
          onRefresh: controller.onRefreshHarvest,
          header: WaterDropMaterialHeader(),
          enablePullDown: true,
          enablePullUp: false,
          child: Obx(() => controller.isLoading.isTrue
              ? Center(child: CircularProgressIndicator())
              : controller.harvestRecap.isNotEmpty
                  ? SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Column(
                          children: [
                            ListView.builder(
                              itemCount: controller.harvestRecap.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final data = controller.harvestRecap[index];
                                return ItemView(data);
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  : Center(
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
                    )),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: const Color(0xff16A085),
      //   foregroundColor: Colors.white,
      //   // mini: true,
      //   onPressed: () => Get.toNamed(Routes.ADD_TANDUR),
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
