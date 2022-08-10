import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petani_app/app/modules/education/controllers/education_controller.dart';
import 'package:petani_app/app/utils/base_url.dart';
import 'package:path/path.dart' as p;

import 'package:get/get.dart';

class DetailEducationView extends GetView<EducationController> {
  @override
  Widget build(BuildContext context) {
    final data = controller.findByid(Get.arguments);
    final path = data.file;
    // DateTime datetime = DateTime.parse(data.date);
    final extension = p.extension(path!);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: Obx(
        () => controller.education.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      (extension == '.mp4')
                          ? AspectRatio(
                              aspectRatio: 16 / 9,
                              child: BetterPlayer.network(
                                baseUrlFile + "storage/edukasi/" + data.file!,
                                betterPlayerConfiguration:
                                    const BetterPlayerConfiguration(
                                  aspectRatio: 16 / 9,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            )
                          : Hero(
                              tag: data.slug!,
                              child: Center(
                                child: Image.network(
                                  "http://192.168.43.123:8000/storage/edukasi/" +
                                      data.file!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(17, 17, 17, 0),
                        child: Text(
                          data.title!,
                          // "Greyhound divisively hello coldly wonderfully",
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(17, 1, 17, 2),
                        child: Text(
                          DateFormat("EEEE, d MMMM yyyy", "id_ID")
                              .format(data.date!),
                          style: const TextStyle(
                            color: Colors.black38,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(17, 5, 17, 0),
                        child: Text(data.desc!,
                            // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                            textAlign: TextAlign.justify,
                            style:
                                const TextStyle(fontSize: 14.0, height: 1.5)),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
