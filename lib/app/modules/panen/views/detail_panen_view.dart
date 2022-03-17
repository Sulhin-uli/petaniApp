import 'package:flutter/material.dart';
import 'package:petani_app/app/modules/kegiatan/controllers/kegiatan_controller.dart';
import 'package:petani_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

class DetailPanenView extends GetView<KegiatanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Detail Panen',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        leading: BackButton(color: Colors.black),
        actions: [
          Container(
            alignment: Alignment.topRight,
            child: PopupMenuButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  child: ListTile(
                    onTap: () => Get.toNamed(Routes.EDIT_PANEN),
                    leading: Icon(Icons.edit),
                    title: Text('Ubah'),
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(
                    onTap: () {
                      controller.dialogQuestion(
                          "Hapus", "Yakin menghapus data?", context);
                    },
                    leading: Icon(Icons.delete),
                    title: Text('Delete'),
                  ),
                ),
              ],
            ),
          ),
        ],
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.startupdonut.co.uk/sites/default/files/styles/landing_pages_lists/public/Guy_watson_249x167.png?itok=e_ct04Rx'),
                ),
                title: const Text('Name Poktan'),
              ),
              Divider(
                color: Colors.black.withOpacity(0.5),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Text(
                  "Title",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Column",
                          style: TextStyle(
                            color: Color(0xff919A92),
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Text(
                          "Value",
                          style: TextStyle(
                            color: Color(0xff919A92),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0xff919A92),
                    ),
                    Row(
                      children: [
                        Text(
                          "Column",
                          style: TextStyle(
                            color: Color(0xff919A92),
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Text(
                          "Value",
                          style: TextStyle(
                            color: Color(0xff919A92),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0xff919A92),
                    ),
                    Row(
                      children: [
                        Text(
                          "Column",
                          style: TextStyle(
                            color: Color(0xff919A92),
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Text(
                          "Value",
                          style: TextStyle(
                            color: Color(0xff919A92),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0xff919A92),
                    ),
                    Container(
                      height: 200,
                    )
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
