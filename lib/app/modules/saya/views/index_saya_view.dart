import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/saya_controller.dart';

class IndexSayaView extends GetView<SayaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(
                  Icons.account_circle_rounded,
                  size: 60,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Name Account",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                child: Column(
                  children: [
                    Divider(
                      color: Color(0xff919A92),
                    ),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: const Text('Kembali Ke Home'),
                    ),
                    Divider(
                      color: Color(0xff919A92),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 16,
                ),
                child: Text(
                  "Aktivitas Saya",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.circle),
                title: const Text('Title Menu'),
              ),
              ListTile(
                leading: Icon(Icons.circle),
                title: const Text('Title Menu'),
              ),
              ListTile(
                leading: Icon(Icons.circle),
                title: const Text('Title Menu'),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 16,
                ),
                child: Text(
                  "Pengaturan Akun",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: const Text('Ubah Akun'),
              ),
              ListTile(
                leading: Icon(Icons.vpn_key),
                title: const Text('Ubah Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
