import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petani_app/app/modules/tandur/controllers/tandur_controller.dart';
import 'package:petani_app/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:petani_app/app/utils/base_url.dart';

class DetailTandurView extends GetView<TandurController> {
  @override
  Widget build(BuildContext context) {
    final data = controller.findByTandur(Get.arguments);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Detail Tandur',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
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
              ListTile(
                leading: (data.farmerId!.image == null)
                    ? CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/noimage.png"),
                      )
                    : CircleAvatar(
                        backgroundImage: NetworkImage(
                          baseUrlFile +
                              "storage/profile/" +
                              data.farmerId!.image!,
                        ),
                      ),
                title: Text(data.farmerId!.userId!.name!),
              ),
              Divider(
                color: Colors.black.withOpacity(0.5),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: const Text(
                  "Detail",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          width: 80,
                          child: Text(
                            "Tanaman",
                            style: TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 50,
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            data.plantTanaman!,
                            style: const TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Color(0xff919A92),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 80,
                          child: Text(
                            "Luas Tanah",
                            style: TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 50,
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            data.surfaceArea!,
                            style: const TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Color(0xff919A92),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          width: 80,
                          child: Text(
                            "Alamat",
                            style: TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 50,
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            data.address!,
                            style: TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Color(0xff919A92),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 80,
                          child: Text(
                            "Tgl Tandur",
                            style: TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 50,
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            DateFormat("EEEE, d MMMM yyyy", "id_ID")
                                .format(DateTime.tryParse(data.platingDate!)!),
                            style: const TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Color(0xff919A92),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 46, //height of button
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff16A085), // background
                        ),
                        onPressed: () => Get.toNamed(Routes.ADD_HARVEST_DATE,
                            arguments: data.id),
                        child: const Text('Tambah Tanggal Panen'),
                      ),
                    ),
                    Container(
                      height: 200,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
