import 'package:flutter/material.dart';
import 'package:petani_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

class ItemView extends GetView {
  // ItemView(this.data);
  // final data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.DETAIL_KEGIATAN),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              child: ListTile(
                title: const Text('Nama kegiatan'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Author',
                      style: TextStyle(color: Colors.red),
                    ),
                    Text(
                      '20 Januari 2022',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
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
