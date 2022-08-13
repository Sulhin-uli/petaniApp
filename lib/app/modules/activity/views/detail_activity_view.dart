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
              Text(
                data.title!,
                textAlign: TextAlign.left,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Dibuat oleh ",
                    style: TextStyle(
                      // color: Colors.black.withOpacity(0.6),
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    data.userId!.name!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Color(0xff919A92),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                data.desc!,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                  height: 2.0,
                  // color: Colors.black.withOpacity(0.5),
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              Text(
                // "Kegiatan dilaksanakan pada " +
                DateFormat("EEEE, d MMMM yyyy", "id_ID").format(datetime),
                style: TextStyle(
                  // color: Colors.black.withOpacity(0.6),
                  fontSize: 12.0,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
