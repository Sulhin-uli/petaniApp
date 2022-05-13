import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petani_app/app/modules/tandur/controllers/tandur_controller.dart';
import 'package:petani_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

class ItemView extends GetView<TandurController> {
  ItemView(this.data);
  final data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.DETAIL_PANEN, arguments: data!.id),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.startupdonut.co.uk/sites/default/files/styles/landing_pages_lists/public/Guy_watson_249x167.png?itok=e_ct04Rx'),
              ),
              title: Text(data.farmerId.userId.name),
              subtitle: Text(
                DateFormat("EEEE, d MMMM yyyy", "id_ID")
                    .format(DateTime.tryParse(data.platingDate)!),
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
              trailing: Wrap(
                spacing: 1, // space between two icons
                children: [
                  InkWell(
                    onTap: () =>
                        Get.toNamed(Routes.EDIT_PANEN, arguments: data.id),
                    child: Icon(
                      Icons.edit,
                      size: 20,
                    ),
                  ),
                  SizedBox(width: 5),
                  InkWell(
                    onTap: () => controller.dialogDelete(context, data.id),
                    child: Icon(
                      Icons.delete,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
