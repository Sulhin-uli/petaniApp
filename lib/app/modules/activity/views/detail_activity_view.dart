import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petani_app/app/modules/activity/controllers/activity_controller.dart';
import 'package:get/get.dart';

class DetailActivityView extends GetView<ActivityController> {
  @override
  Widget build(BuildContext context) {
    final data = controller.findByid(Get.arguments);
    DateTime datetime = DateTime.parse(data.date!.toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  data.title!,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                data.desc!,
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
                "Kegiatan dilaksanakan pada " +
                    DateFormat("EEEE, d MMMM yyyy", "id_ID").format(datetime),
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "Dibuat oleh ",
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                  Text(
                    data.userId!.name!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
