import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petani_app/app/modules/activity/controllers/activity_controller.dart';
import 'package:petani_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

class ItemActivityView extends GetView<ActivityController> {
  const ItemActivityView(this.data);
  final data;

  @override
  Widget build(BuildContext context) {
    // DateTime datetime = DateTime.parse(data.date!);
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.DETAIL_ACTIVITY, arguments: data.id),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 3,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: ListTile(
                title: Container(
                    margin: const EdgeInsets.only(
                      bottom: 6,
                    ),
                    child: Text(data.title)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.userId.name,
                      style: const TextStyle(color: Colors.red, fontSize: 12),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      DateFormat("EEEE, d MMMM yyyy", "id_ID")
                          .format(data.date!),
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6), fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
