import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petani_app/app/modules/home/controllers/home_controller.dart';
import 'package:petani_app/app/modules/home/views/widget/body_widget.dart';
import 'package:petani_app/app/utils/constant.dart';
import 'package:petani_app/app/modules/saya/views/index_saya_view.dart';
import 'package:get/get.dart';

class IndexHomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Obx(() => IndexedStack(
            index: controller.tabIndex.value,
            children: [
              Body(),
              // IndexSayaView(),
              Container(),
            ],
          )),
      bottomNavigationBar: buildBottomNavigationMenu(context, controller),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kPrimaryColor,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
    );
  }

  // Tabbar Bottom
  final TextStyle unselectedLabelStyle = TextStyle(
    color: Colors.white.withOpacity(0.5),
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  final TextStyle selectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(
      () => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 54,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedItemColor: const Color(0xff16A085),
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Image.asset(
                    "assets/icons/home.png",
                    width: 20,
                    height: 20,
                  ),
                ),
                label: 'Home',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Image.asset(
                    "assets/icons/saya.png",
                    width: 20,
                    height: 20,
                  ),
                ),
                label: 'Saya',
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
