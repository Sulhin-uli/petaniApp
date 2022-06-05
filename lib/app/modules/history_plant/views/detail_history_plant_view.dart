import 'package:flutter/material.dart';
import 'package:format_indonesia/format_indonesia.dart';

import 'package:get/get.dart';
import 'package:petani_app/app/modules/tandur/controllers/tandur_controller.dart';

class DetailHistoryPlantView extends GetView<TandurController> {
  @override
  Widget build(BuildContext context) {
    final data = controller.findBySelesai(Get.arguments);
    DateTime platingDateC = DateTime.parse(data.platingDate!);
    DateTime harvestDateC = DateTime.parse(data.harvestDate!);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Detail Riwayat Penanaman',
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
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.startupdonut.co.uk/sites/default/files/styles/landing_pages_lists/public/Guy_watson_249x167.png?itok=e_ct04Rx'),
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
                            Waktu(platingDateC).yMMMMEEEEd(),
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
                            "Tgl Panen",
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
                            Waktu(harvestDateC).yMMMMEEEEd(),
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
