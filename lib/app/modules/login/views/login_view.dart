import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: BackButton(color: Colors.black),
        title: const Text(
          'Masuk',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text(
                "Email",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: loginController.email,
                cursorColor: const Color(0xff16A085),
                decoration: const InputDecoration(
                  helperText: 'Contoh: pedri16@gmail.com',
                  // fillColor: Color(0xff919A92),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff919A92),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff16A085),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Password",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              Obx(
                () => TextFormField(
                  controller: loginController.password,
                  cursorColor: const Color(0xff16A085),
                  obscureText: loginController.hiddenTextPassword.value,
                  decoration: InputDecoration(
                    // fillColor: Color(0xff919A92),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff919A92),
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff16A085),
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () =>
                          loginController.hiddenTextPassword.toggle(),
                      icon: loginController.hiddenTextPassword.isTrue
                          ? const Icon(
                              Icons.remove_red_eye,
                              color: Color(0xff16A085),
                            )
                          : const Icon(
                              Icons.remove_red_eye_outlined,
                              color: Color(0xff16A085),
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Lupa Kata Sandi?",
                    style: TextStyle(
                      color: Color(0xff16A085),
                    ),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 46, //height of button
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff16A085), // background
                    ),
                    onPressed: () => loginController.login(
                        loginController.email.text,
                        loginController.password.text),
                    child: const Text('Masuk'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
