import 'dart:io';
import 'package:flutter/material.dart';
import 'package:petani_app/app/modules/education/controllers/education_controller.dart';
import 'package:petani_app/app/routes/app_pages.dart';
import 'package:petani_app/app/utils/base_url.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path/path.dart' as p;

class ItemView extends StatefulWidget {
  const ItemView(this.data);
  final data;

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  String? _thumbnailUrl;
  String? path;
  String? extension;
  void generateThumbnail() async {
    _thumbnailUrl = await VideoThumbnail.thumbnailFile(
        video: baseUrlFile + "storage/edukasi/" + widget.data.file,
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.PNG);

    setState(() {});
  }

  @override
  void initState() {
    path = widget.data.file;
    extension = p.extension(path!);
    super.initState();
    if (extension == '.mp4') {
      generateThumbnail();
    }
  }

  @override
  Widget build(BuildContext context) {
    final EducationController educationC = Get.put(EducationController());
    return GestureDetector(
      onTap: () =>
          Get.toNamed(Routes.DETAIL_EDUCATION, arguments: widget.data.id),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: widget.data.slug,
                child: Center(
                  child: (extension != '.mp4')
                      ? Image.network(
                          baseUrlFile + "storage/edukasi/" + widget.data.file)
                      : (_thumbnailUrl != null)
                          ? Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.file(File(_thumbnailUrl!)),
                                const CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.black45,
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )
                          : const CircularProgressIndicator(),
                  // : Icon(
                  //     Icons.ondemand_video,
                  //     size: 80,
                  //   ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Text(
                widget.data.title,
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
