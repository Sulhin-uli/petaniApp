import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:petani_app/app/modules/home/controllers/home_controller.dart';

class ItemMenu extends GetView<HomeController> {
  const ItemMenu(this.data);
  final data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(data.route!),
      child: Container(
        child: Column(
          children: [
            SizedBox(
              // color: index % 2 == 0 ? Colors.amber : Colors.red,
              width: 37,
              height: 37,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    side: const BorderSide(color: Colors.black12)),
                padding: const EdgeInsets.all(8),
                color: Colors.white,
                onPressed: () => data.route! != 'saya'
                    ? Get.toNamed(data.route!)
                    : controller.changeTabIndex(1),
                child: Image.network(
                  data.image!,
                  color: data.color!,
                ),
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            Text(
              data.title!,
              maxLines: 2,
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontSize: 10, color: Colors.black.withOpacity(0.5)),
            ),
          ],
        ),
      ),
    );
  }
}
