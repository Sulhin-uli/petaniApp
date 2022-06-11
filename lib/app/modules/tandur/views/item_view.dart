import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petani_app/app/modules/tandur/controllers/tandur_controller.dart';
import 'package:petani_app/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:petani_app/app/utils/base_url.dart';

class ItemView extends GetView<TandurController> {
  const ItemView(this.data);
  final data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        controller.isMark(true);
      },
      onTap: () => Get.toNamed(Routes.DETAIL_TANDUR, arguments: data!.id),
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
                DateFormat("EEEE, d MMMM yyyy", "id_ID")
                    .format(DateTime.tryParse(data.platingDate)!),
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
              trailing: Obx(
                () => controller.isMark.value == true
                    ? Checkbox(
                        value: data.isMark!,
                        onChanged: (e) {
                          data.isMark = e;
                          controller.plantTandur.refresh();
                          if (data.isMark == true) {
                            controller.itemId.add(data.id);
                          } else if (data.isMark == false) {
                            controller.itemId.remove(data.id);
                          }
                        })
                    : Wrap(
                        spacing: 1, // space between two icons
                        children: [
                          InkWell(
                            onTap: () => Get.toNamed(Routes.EDIT_TANDUR,
                                arguments: data.id),
                            child: const Icon(
                              Icons.edit,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () => controller.dialogDelete(
                                context, data.id, "tandur"),
                            child: const Icon(
                              Icons.delete,
                              size: 20,
                            ),
                          )
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
