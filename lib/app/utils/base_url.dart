import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

const baseUrl = "http://192.168.43.38:8001/api/";
const baseUrlFile = "http://192.168.43.38:8001/";

// dialog
void dialog(String title, String msg) {
  Get.defaultDialog(
    title: title,
    content: Text(
      msg,
      textAlign: TextAlign.center,
    ),
  );
  Future.delayed(const Duration(seconds: 3), () {
    Get.back();
  });
}

void dialogNoBack(String title, String msg) {
  Get.defaultDialog(
    title: title,
    content: Text(
      msg,
      textAlign: TextAlign.center,
    ),
  );
}
