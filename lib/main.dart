import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:petani_app/app/modules/login/controllers/authcontroller_controller.dart';
import 'package:petani_app/app/modules/login/controllers/login_controller.dart';
import 'package:petani_app/app/utils/error_screen.dart';
import 'package:petani_app/app/utils/loading_screen.dart';
import 'package:petani_app/app/utils/splash_screen.dart';

import 'app/routes/app_pages.dart';

// Future<void> main() async {
//   await GetStorage.init();
//   WidgetsFlutterBinding.ensureInitialized();
//   await initializeDateFormatting('id_ID', null).then(
//     (_) => runApp(
//       GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: "Application",
//         initialRoute: AppPages.INITIAL,
//         getPages: AppPages.routes,
//       ),
//     ),
//   );
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.instance.getInitialMessage();
  await GetStorage.init();
  await initializeDateFormatting('id_ID', null).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  LoginController authLoginC = Get.put(LoginController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorScreen();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return FutureBuilder(
            future: Future.delayed(Duration(seconds: 3)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: "TaniKula",
                  initialRoute:
                      authLoginC.isAuth.isTrue ? Routes.HOME : Routes.LOGIN,
                  theme: ThemeData(
                    primarySwatch: Colors.green,
                  ),
                  getPages: AppPages.routes,
                );
              }

              return SplashScreen();
            },
          );
        }

        return LoadingScreen();
      },
    );
  }
}
