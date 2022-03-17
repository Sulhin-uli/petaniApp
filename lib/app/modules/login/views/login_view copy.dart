import 'package:flutter/material.dart';
import 'package:petani_app/app/modules/login/views/widget/BackGround%20.dart';
import 'package:petani_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackGround(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Login'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1A5F7A),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "E-mail",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1A5F7A)),
                  ),
                ),
              ),
              Material(
                elevation: 1.0,
                shadowColor: Color(0xff1A5F7A),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[100],
                      filled: true),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Password",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1A5F7A)),
                  ),
                ),
              ),
              Material(
                elevation: 1.0,
                shadowColor: Color(0xff1A5F7A),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[100],
                      filled: true),
                ),
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  'Lupa password?',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1A5F7A),
                  ),
                ),
              ),
              SizedBox(height: 50),
              RaisedButton(
                onPressed: () => Get.toNamed(Routes.HOME),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.white,
                padding: EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80.0),
                    gradient: LinearGradient(
                      colors: [Color(0xffFFC900), Color(0xffFFF89A)],
                    ),
                  ),
                  child: Text('LOGIN',
                      style: TextStyle(
                        color: Color(0xff1A5F7A),
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '''Tidak punya akun?''',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Registrasi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1A5F7A),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
