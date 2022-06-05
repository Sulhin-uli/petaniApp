// import 'package:flutter/material.dart';
// import 'package:poktan_app/app/routes/app_pages.dart';
// import 'package:getwidget/getwidget.dart';
// import 'package:get/get.dart';

// import '../controllers/home_controller.dart';

// class HomeView extends GetView<HomeController> {
//   final TextStyle unselectedLabelStyle = TextStyle(
//     color: Colors.white.withOpacity(0.5),
//     fontWeight: FontWeight.w500,
//     fontSize: 12,
//   );
//   final TextStyle selectedLabelStyle =
//       TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);
//   buildBottomNavigationMenu(context, landingPageController) {
//     return Obx(() => MediaQuery(
//         data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
//         child: SizedBox(
//           height: 54,
//           child: BottomNavigationBar(
//             showUnselectedLabels: true,
//             showSelectedLabels: true,
//             onTap: landingPageController.changeTabIndex,
//             currentIndex: landingPageController.tabIndex.value,
//             backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
//             unselectedItemColor: Colors.grey,
//             selectedItemColor: Color(0xff603601),
//             unselectedLabelStyle: unselectedLabelStyle,
//             selectedLabelStyle: selectedLabelStyle,
//             items: [
//               BottomNavigationBarItem(
//                 icon: Container(
//                   margin: EdgeInsets.only(bottom: 7),
//                   child: Icon(
//                     Icons.home,
//                     size: 20.0,
//                   ),
//                 ),
//                 label: 'Home',
//                 backgroundColor: Colors.white,
//               ),
//               BottomNavigationBarItem(
//                 icon: Container(
//                   margin: EdgeInsets.only(bottom: 7),
//                   child: Icon(
//                     Icons.search,
//                     size: 20.0,
//                   ),
//                 ),
//                 label: 'Home',
//                 backgroundColor: Colors.white,
//               ),
//               BottomNavigationBarItem(
//                 icon: Container(
//                   margin: EdgeInsets.only(bottom: 7),
//                   child: Icon(
//                     Icons.location_history,
//                     size: 20.0,
//                   ),
//                 ),
//                 label: 'Home',
//                 backgroundColor: Colors.white,
//               ),
//               BottomNavigationBarItem(
//                 icon: Container(
//                   margin: EdgeInsets.only(bottom: 7),
//                   child: Icon(
//                     Icons.settings,
//                     size: 20.0,
//                   ),
//                 ),
//                 label: 'Home',
//                 backgroundColor: Colors.white,
//               ),
//             ],
//           ),
//         )));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         // backgroundColor: Colors.amber,
//         title: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             // Image.asset(
//             //   'assets/logo/logo.png',
//             //   width: 200,
//             //   height: 200,
//             // ),
//             Text(
//               "Poktan",
//               style: TextStyle(color: Colors.white, fontSize: 18.0),
//             ),
//             Text(
//               "App",
//               style: TextStyle(color: Color(0xff66ffb3), fontSize: 18.0),
//             )
//           ],
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.notifications,
//               color: Color(0xff66ffb3),
//             ),
//           ),
//         ],
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage('assets/images/appbar-image.png'),
//                   fit: BoxFit.fill)),
//         ),
//         elevation: 0,
//       ),
//       backgroundColor: Color(0xfffaf4eb),
//       bottomNavigationBar: buildBottomNavigationMenu(context, controller),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.all(16),
//             child: Card(
//               color: Color(0xffCC9544),
//               clipBehavior: Clip.antiAlias,
//               child: Column(
//                 children: [
//                   ListTile(
//                     title: const Text(
//                       'Card title 1',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     subtitle: Text(
//                       'Dummy Text',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20.0),
//                   topRight: Radius.circular(20.0),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 20),
//                 child: Container(
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             children: [
//                               MaterialButton(
//                                 // onPressed: () => Get.toNamed(Routes.EDUKASI),
//                                 onPressed: () {},
//                                 color: Color(0xff603601),
//                                 textColor: Colors.white,
//                                 child: Icon(
//                                   Icons.article,
//                                   size: 24,
//                                 ),
//                                 padding: EdgeInsets.all(8),
//                                 shape: CircleBorder(),
//                               ),
//                               SizedBox(
//                                 height: 11,
//                               ),
//                               Text(
//                                 "Edukasi",
//                                 maxLines: 2,
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(color: Color(0xff1C0A00)),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               MaterialButton(
//                                 onPressed: () {},
//                                 color: Color(0xff603601),
//                                 textColor: Colors.white,
//                                 child: Icon(
//                                   Icons.article,
//                                   size: 24,
//                                 ),
//                                 padding: EdgeInsets.all(8),
//                                 shape: CircleBorder(),
//                               ),
//                               SizedBox(
//                                 height: 11,
//                               ),
//                               Text(
//                                 "Jadwal tandur",
//                                 maxLines: 2,
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(color: Color(0xff1C0A00)),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               MaterialButton(
//                                 onPressed: () {},
//                                 color: Color(0xff603601),
//                                 textColor: Colors.white,
//                                 child: Icon(
//                                   Icons.article,
//                                   size: 24,
//                                 ),
//                                 padding: EdgeInsets.all(8),
//                                 shape: CircleBorder(),
//                               ),
//                               SizedBox(
//                                 height: 11,
//                               ),
//                               Text(
//                                 "Jadwal panen",
//                                 maxLines: 2,
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(color: Color(0xff1C0A00)),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 12,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             children: [
//                               MaterialButton(
//                                 // onPressed: () => Get.toNamed(Routes.PRODUK),
//                                 onPressed: () {},

//                                 color: Color(0xff603601),
//                                 textColor: Colors.white,
//                                 child: Icon(
//                                   Icons.shopping_cart_rounded,
//                                   size: 24,
//                                 ),
//                                 padding: EdgeInsets.all(8),
//                                 shape: CircleBorder(),
//                               ),
//                               SizedBox(
//                                 height: 11,
//                               ),
//                               Text(
//                                 "Produk",
//                                 maxLines: 2,
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(color: Color(0xff1C0A00)),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               MaterialButton(
//                                 onPressed: () {},
//                                 color: Color(0xff603601),
//                                 textColor: Colors.white,
//                                 child: Icon(
//                                   Icons.article,
//                                   size: 24,
//                                 ),
//                                 padding: EdgeInsets.all(8),
//                                 shape: CircleBorder(),
//                               ),
//                               SizedBox(
//                                 height: 11,
//                               ),
//                               Text(
//                                 "Kegiatan",
//                                 maxLines: 2,
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(color: Color(0xff1C0A00)),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               MaterialButton(
//                                 // onPressed: () => Get.toNamed(Routes.POKTAN),
//                                 onPressed: () {},
//                                 color: Color(0xff603601),
//                                 textColor: Colors.white,
//                                 child: Icon(
//                                   Icons.supervised_user_circle,
//                                   size: 24,
//                                 ),
//                                 padding: EdgeInsets.all(8),
//                                 shape: CircleBorder(),
//                               ),
//                               SizedBox(
//                                 height: 11,
//                               ),
//                               Text(
//                                 "Petani",
//                                 maxLines: 2,
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(color: Color(0xff1C0A00)),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
