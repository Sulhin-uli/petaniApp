import 'package:flutter/material.dart';
import 'package:petani_app/app/modules/login/controllers/authcontroller_controller.dart';

import 'package:get/get.dart';

class CheckAuthView extends GetView<AuthcontrollerController> {
  final authC = Get.put(AuthcontrollerController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xff16A085)),
          ),
        ));
  }
}
