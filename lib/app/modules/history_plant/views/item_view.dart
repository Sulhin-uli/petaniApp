import 'package:flutter/material.dart';
import 'package:format_indonesia/format_indonesia.dart';
import 'package:petani_app/app/modules/tandur/controllers/tandur_controller.dart';
import 'package:petani_app/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:petani_app/app/utils/base_url.dart';

class ItemView extends GetView<TandurController> {
  const ItemView(this.data);
  final data;

  @override
  Widget build(BuildContext context) {
    DateTime datetime = DateTime.parse(data.platingDate!);
    return GestureDetector(
      onTap: () =>
          Get.toNamed(Routes.DETAIL_HISTORY_PLANT, arguments: data!.id),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              leading: (data.farmerId!.image == null)
                  ? CircleAvatar(
                      backgroundImage: AssetImage("assets/images/noimage.png"),
                    )
                  : CircleAvatar(
                      backgroundImage: NetworkImage(
                        baseUrlFile + "storage/profile/" + data.farmerId!.image,
                      ),
                    ),
              title: Text(data.farmerId.userId.name),
              subtitle: Text(
                Waktu(datetime).yMMMMEEEEd(),
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
