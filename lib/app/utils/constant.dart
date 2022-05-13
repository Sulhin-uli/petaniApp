// import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// final formatCurrency = NumberFormat("#,##0", "eu");

// Colors that we use in our app
const kPrimaryColor = Color(0xff16A085);
const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFFF9F8FD);

const double kDefaultPadding = 20.0;

// dialog
void dialog(String title, String msg) {
  Get.defaultDialog(
    title: title,
    content: Text(
      msg,
      textAlign: TextAlign.center,
    ),
  );
  Future.delayed(Duration(seconds: 3), () {
    Get.back();
  });
}
