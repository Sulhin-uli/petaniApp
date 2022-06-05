import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petani_app/app/modules/home/Models/menu_home_model.dart';
import 'package:petani_app/app/modules/login/controllers/login_controller.dart';
import 'package:petani_app/app/modules/tandur/views/index_tandur_view.dart';
import 'package:petani_app/app/routes/app_pages.dart';

class HomeController extends GetxController {
  var tabIndex = 0.obs;
  var menu_home = List<MenuHome>.empty().obs;
  LoginController loginController = Get.put(LoginController());

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  void getDataItemMenu() {
    final data1 = MenuHome(
      id: "1",
      image:
          "https://cdn.icon-icons.com/icons2/3361/PNG/512/preferences_user_interface_ux_apps_grid_options_ui_menu_categories_icon_210806.png",
      title: "Jadwal Tandur",
      color: Colors.green,
      route: Routes.INDEX_TANDUR,
    );
    menu_home.add(data1);

    final data2 = MenuHome(
      id: "2",
      image:
          "https://cdn.icon-icons.com/icons2/3361/PNG/512/preferences_user_interface_ux_apps_grid_options_ui_menu_categories_icon_210806.png",
      title: "Jadwal Panen",
      color: Colors.green,
      route: Routes.INDEX_PANEN,
    );
    menu_home.add(data2);

    final data3 = MenuHome(
      id: "3",
      image:
          "https://cdn.icon-icons.com/icons2/3361/PNG/512/preferences_user_interface_ux_apps_grid_options_ui_menu_categories_icon_210806.png",
      title: "Edukasi",
      color: Colors.green,
      route: Routes.INDEX_EDUCATION,
    );
    menu_home.add(data3);

    final data4 = MenuHome(
        id: "4",
        image:
            "https://cdn.icon-icons.com/icons2/3361/PNG/512/preferences_user_interface_ux_apps_grid_options_ui_menu_categories_icon_210806.png",
        title: "Kegiatan",
        color: Colors.green,
        route: Routes.INDEX_ACTIVITY);
    menu_home.add(data4);

    final data9 = MenuHome(
      id: "9",
      image:
          "https://cdn.icon-icons.com/icons2/3361/PNG/512/preferences_user_interface_ux_apps_grid_options_ui_menu_categories_icon_210806.png",
      title: "Saya",
      color: Colors.green,
      route: 'saya',
    );
    menu_home.add(data9);
  }

  @override
  void onInit() {
    getDataItemMenu();
    loginController.getDataPetani();
    super.onInit();
  }
}
