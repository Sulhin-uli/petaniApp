import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

const baseUrl = "http://192.168.43.123:8000/api/";
const baseUrlFile = "http://192.168.43.123:8000/";

void dialog(String title, String msg) {
  Get.defaultDialog(
    titleStyle: TextStyle(fontSize: 12),
    title: title,
    content: Text(
      msg,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 12),
    ),
  );
  // Future.delayed(const Duration(seconds: 5), () {
  //   Get.back();
  // });
}

void dialogNoBack(String title, String msg) {
  Get.defaultDialog(
    title: title,
    titleStyle: TextStyle(fontSize: 12),
    content: Text(
      msg,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 12),
    ),
  );
}

// store
// final data = CartModel.fromJson(response["data"] as Map<String, dynamic>);
// cart.add(data);

// get
// final data = CartModel.fromJson(e as Map<String, dynamic>);
// cart.add(data);

