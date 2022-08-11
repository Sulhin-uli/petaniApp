import 'package:flutter/material.dart';
import 'package:petani_app/app/modules/home/controllers/home_controller.dart';
import 'package:petani_app/app/modules/home/views/widget/item_menu_widget.dart';
import 'package:petani_app/app/modules/login/controllers/login_controller.dart';
import 'package:petani_app/app/routes/app_pages.dart';
import 'package:petani_app/app/utils/constant.dart';
import 'package:get/get.dart';

import 'header_widget.dart';

class Body extends GetView<HomeController> {
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    var name = loginController.userFarmer.first.farmers!.user!.name!;
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Header(size: size, dataUserName: name),
          // SizedBox(
          //   height: 220,
          //   child: GridView.builder(
          //       padding: const EdgeInsets.symmetric(horizontal: 12),
          //       scrollDirection: Axis.horizontal,
          //       itemCount: controller.menu_home.length,
          //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 1, childAspectRatio: 3.3),
          //       itemBuilder: (context, index) {
          //         final data = controller.menu_home[index];
          //         return ItemMenu(data);
          //       }),
          // ),
          // SizedBox(
          //   height: 120,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: controller.banner.length,
          //     itemBuilder: (context, index) {
          //       final data = controller.banner[index];
          //       return Container(
          //         margin: EdgeInsets.fromLTRB(15, 16, 5, 5),
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.all(Radius.circular(8))),
          //         child: Column(
          //           children: <Widget>[
          //             Expanded(
          //               child: Container(
          //                 width: 300,
          //                 decoration: BoxDecoration(
          //                   image: DecorationImage(
          //                     image: NetworkImage(
          //                       // "https://images.unsplash.com/photo-1515276427842-f85802d514a2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=80",
          //                       data.image!,
          //                     ),
          //                     fit: BoxFit.cover,
          //                   ),
          //                   color: Colors.white,
          //                   borderRadius: BorderRadius.all(Radius.circular(8)),
          //                 ),
          //               ),
          //               flex: 75,
          //             ),
          //           ],
          //         ),
          //       );
          //     },
          //   ),
          // ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text(
              "Menu",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () => Get.toNamed(Routes.INDEX_EDUCATION),
                  child: menuVertical(
                      "Edukasi", const Color(0xff16A085), "edukasi.png"),
                ),
                InkWell(
                  onTap: () => Get.toNamed(Routes.INDEX_ACTIVITY),
                  child: menuVertical(
                      "Kegiatan", const Color(0xff16A085), "kegiatan.png"),
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Tanaman",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () => Get.toNamed(Routes.INDEX_TANDUR),
                  child: menuVertical(
                      "Laporan Tandur", const Color(0xff16A085), "tandur.png"),
                ),
                InkWell(
                  onTap: () => Get.toNamed(Routes.INDEX_PANEN),
                  child: menuVertical(
                      "Laporan Panen", const Color(0xff16A085), "panen.png"),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 20,
          // ),
          // SizedBox(
          //   height: 120,
          //   child: ListView(
          //     scrollDirection: Axis.horizontal,
          //     children: [
          //       const SizedBox(
          //         width: 20,
          //       ),
          //       InkWell(
          //         onTap: () => Get.toNamed(Routes.HISTORY_PLANT),
          //         child: menuVertical("Riwayat Penanaman",
          //             const Color(0xff16A085), "history-penanaman.png"),
          //       ),
          //     ],
          //   ),
          // ),
          // const SizedBox(
          //   height: 30,
          // ),
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 20.0),
          //   child: Text(
          //     "Produk",
          //     style: TextStyle(
          //       fontSize: 16,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // ListView(
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   children: [
          //     InkWell(
          //       onTap: () => Get.toNamed(Routes.INDEX_PRODUK),
          //       child: menuHorizontal("Produk", "assets/user2.jpg",
          //           const Color(0xff16A085), context),
          //     ),
          //     InkWell(
          //       onTap: () => Get.toNamed(Routes.INDEX_PRODUCT_CATEGORY),
          //       child: menuHorizontal("Kategori Produk", "assets/user3.jpg",
          //           const Color(0xff16A085), context),
          //     ),
          //   ],
          // ),
          // const SizedBox(
          //   height: 30,
          // ),
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 20.0),
          //   child: Text(
          //     "Kegiatan",
          //     style: TextStyle(
          //       fontSize: 16,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // ListView(
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   children: [
          //     InkWell(
          //       onTap: () => Get.toNamed(Routes.INDEX_ACTIVITY),
          //       child: menuHorizontal("Kegiatan", "assets/user2.jpg",
          //           const Color(0xff16A085), context),
          //     ),
          //     InkWell(
          //       onTap: () => Get.toNamed(Routes.INDEX_ACTIVITY_CATEGORY),
          //       child: menuHorizontal("Kategori Kegiatan", "assets/user3.jpg",
          //           const Color(0xff16A085), context),
          //     ),
          //   ],
          // ),
          // const SizedBox(
          //   height: 30,
          // ),
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 20.0),
          //   child: Text(
          //     "Poktan",
          //     style: TextStyle(
          //       fontSize: 16,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // ListView(
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   children: [
          //     InkWell(
          //       onTap: () => Get.toNamed(Routes.INDEX_POKTAN),
          //       child: menuHorizontal("Akun Poktan", "assets/user2.jpg",
          //           const Color(0xff16A085), context),
          //     ),
          //   ],
          // ),
          const SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }

  Widget menuHorizontal(
      String name, String image, Color color, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
            color: color.withOpacity(0.07),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: ListTile(
              leading: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blueAccent,
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover)),
              ),
              title: Text(
                name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              trailing: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Center(
                      child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                  )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget menuVertical(String name, Color color, String image) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/icons/" + image,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
