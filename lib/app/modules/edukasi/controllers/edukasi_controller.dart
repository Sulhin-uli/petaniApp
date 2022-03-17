import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EdukasiController extends GetxController {
  void dialogQuestion(String title, String msg, BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(msg),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Batal'),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'Ya'),
            child: Text('Ya'),
          ),
        ],
      ),
    );
  }
}
