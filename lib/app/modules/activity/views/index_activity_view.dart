import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petani_app/app/modules/activity/views/item_activity_view.dart';
import 'package:petani_app/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
                    icon: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    onPressed: () {
                      controller.runSearch(controller.seacrh.text);
                      // Get.toNamed(Routes.SEARCH_ACTIVITY);
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
                : Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.seacrh.clear();
                        },
                        icon: Icon(
                          Icons.close_sharp,
                          color: Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          controller.isSearch(false);
                        },
                        icon: Icon(
                          Icons.refresh,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
          )
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
              controller.addItems();
            }
          }
          return true;
        },
        child: SmartRefresher(
          controller: controller.refreshController,
          onRefresh: controller.onRefresh,
          onLoading: controller.onLoading,
          header: WaterDropMaterialHeader(),
          enablePullDown: true,
          enablePullUp: false,
          child: Obx(
            () => controller.activity.isEmpty
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
                    child: ListView.builder(
                      itemCount: controller.activity.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        // final product = productList[index];
                        final data = controller.activity[i];
                        return ItemActivityView(data);
                      },
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
