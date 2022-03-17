import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petani_app/app/modules/home/Models/menu_home_model.dart';
import 'package:petani_app/app/routes/app_pages.dart';

class HomeController extends GetxController {
  var tabIndex = 0.obs;
  var menu_home = List<MenuHome>.empty().obs;

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
      id: "1",
      image:
          "https://cdn.icon-icons.com/icons2/3361/PNG/512/preferences_user_interface_ux_apps_grid_options_ui_menu_categories_icon_210806.png",
      title: "Saya",
      color: Colors.green,
      route: Routes.INDEX_SAYA,
    );
    menu_home.add(data3);

    final data4 = MenuHome(
      id: "4",
      image:
          "https://cdn.icon-icons.com/icons2/3361/PNG/512/preferences_user_interface_ux_apps_grid_options_ui_menu_categories_icon_210806.png",
      title: "Kegiatan",
      color: Colors.green,
      route: Routes.INDEX_KEGIATAN,
    );
    menu_home.add(data4);

    final data5 = MenuHome(
      id: "5",
      image:
          "https://cdn.icon-icons.com/icons2/3361/PNG/512/preferences_user_interface_ux_apps_grid_options_ui_menu_categories_icon_210806.png",
      title: "Menu",
      color: Colors.green,
      route: Routes.INDEX_EDUKASI,
    );
    menu_home.add(data5);

    final data6 = MenuHome(
      id: "6",
      image:
          "https://cdn.icon-icons.com/icons2/3361/PNG/512/preferences_user_interface_ux_apps_grid_options_ui_menu_categories_icon_210806.png",
      title: "Edukasi",
      color: Colors.green,
      route: Routes.INDEX_EDUKASI,
    );
    menu_home.add(data6);

    final data7 = MenuHome(
      id: "7",
      image:
          "https://cdn.icon-icons.com/icons2/3361/PNG/512/preferences_user_interface_ux_apps_grid_options_ui_menu_categories_icon_210806.png",
      title: "Notifikasi",
      color: Colors.green,
      route: Routes.INDEX_NOTIFIKASI,
    );
    menu_home.add(data7);

    final data8 = MenuHome(
      id: "8",
      image:
          "https://cdn.icon-icons.com/icons2/3361/PNG/512/preferences_user_interface_ux_apps_grid_options_ui_menu_categories_icon_210806.png",
      title: "Menu",
      color: Colors.green,
      route: Routes.INDEX_SAYA,
    );
    menu_home.add(data8);

    // final datas = [
    //   {
    //     "id": "1",
    //     "image":
    //         "https://cdn.icon-icons.com/icons2/3361/PNG/512/preferences_user_interface_ux_apps_grid_options_ui_menu_categories_icon_210806.png",
    //     "title": "Jadwal Tandur",
    //     "color": "32a86d",
    //     "route": Routes.INDEX_EDUKASI,
    //   },
    //   {
    //     "id": "1",
    //     "image":
    //         "https://cdn.icon-icons.com/icons2/3361/PNG/512/preferences_user_interface_ux_apps_grid_options_ui_menu_categories_icon_210806.png",
    //     "title": "Jadwal Tandur",
    //     "color": "32a86d",
    //     "route": Routes.INDEX_EDUKASI,
    //   }
    // ];

    // for (var i = 0; i < datas.length; i++) {
    //   final data = MenuHome(
    //     id: datas[i]["id"].toString(),
    //     image: datas[i]["image"].toString(),
    //     color: datas[i]["color"].toString(),
    //     route: datas[i]["route"].toString(),
    //   );
    //   menu_home.add(data);
    // }
  }

  @override
  void onInit() {
    getDataItemMenu();
    super.onInit();
  }
}
