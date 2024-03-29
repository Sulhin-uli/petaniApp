// import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// final formatCurrency = NumberFormat("#,##0", "eu");

// Colors that we use in our app
const kPrimaryColor = Color(0xff16A085);
const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFFF9F8FD);

const double kDefaultPadding = 20.0;

void dialogError(String msg) {
  Get.defaultDialog(
    title: "Peringatan",
    titleStyle: TextStyle(fontSize: 12),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          msg,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
        TextButton(
            onPressed: () => Get.back(),
            child: Text(
              "Tutup",
              style: TextStyle(fontSize: 12),
            ))
      ],
    ),
  );
}

void dialogSuccess(String msg) {
  Get.defaultDialog(
    title: "Info",
    titleStyle: TextStyle(fontSize: 12),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          msg,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
        TextButton(
            onPressed: () => Get.back(),
            child: Text(
              "Tutup",
              style: TextStyle(fontSize: 12),
            ))
      ],
    ),
  );
}
