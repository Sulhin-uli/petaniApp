import 'package:flutter/material.dart';
import 'package:petani_app/app/modules/kegiatan/controllers/kegiatan_controller.dart';
import 'package:petani_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

class DetailKegiatanView extends GetView<KegiatanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Nama Kegiatan',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                // "data.content!",
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 14.0,
                  height: 1.5,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
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
    );
  }
}
