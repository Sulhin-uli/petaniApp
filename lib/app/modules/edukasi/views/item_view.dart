import 'package:flutter/material.dart';
import 'package:petani_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

class ItemView extends GetView {
  // ItemView(this.data);
  // final data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.DETAIL_EDUKASI),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Expanded(
              child: Hero(
                  tag: 'judul',
                  child: Center(
                    child: Image.network(
                        "https://www.thehindu.com/sci-tech/agriculture/87sx5z/article30131510.ece/alternates/LANDSCAPE_615/NEWS2FARMER"),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
