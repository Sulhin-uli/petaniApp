// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:petani_app/app/modules/tandur/controllers/tandur_controller.dart';
// import 'package:intl/intl.dart';

// class AddTandurView extends GetView<TandurController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: const BackButton(color: Colors.black),
//         title: const Text(
//           'Tambah Tandur',
//           style: TextStyle(color: Colors.black, fontSize: 16),
//         ),
//         elevation: 0.5,
//       ),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "Nama Tanaman",
//                 style: TextStyle(
//                   color: Color(0xff919A92),
//                 ),
//               ),
//               TextFormField(
//                 controller: controller.plant_tanaman,
//                 cursorColor: const Color(0xff16A085),
//                 decoration: const InputDecoration(
//                   // helperText: 'Contoh: Label',
//                   // fillColor: Color(0xff919A92),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Color(0xff919A92),
//                     ),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Color(0xff16A085),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               const Text(
//                 "Luas Tanah",
//                 style: TextStyle(
//                   color: Color(0xff919A92),
//                 ),
//               ),
//               TextFormField(
//                 controller: controller.surface_area,
//                 cursorColor: const Color(0xff16A085),
//                 decoration: const InputDecoration(
//                   // helperText: 'Contoh: Label',
//                   // fillColor: Color(0xff919A92),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Color(0xff919A92),
//                     ),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Color(0xff16A085),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               const Text(
//                 "Alamat",
//                 style: TextStyle(
//                   color: Color(0xff919A92),
//                 ),
//               ),
//               const SizedBox(
//                 height: 9,
//               ),
//               TextFormField(
//                 maxLines: 5,
//                 controller: controller.address,
//                 cursorColor: const Color(0xff16A085),
//                 decoration: InputDecoration(
//                   // helperText: 'Contoh: Label',
//                   // fillColor: Color(0xff919A92),
//                   enabledBorder: const UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Color(0xff919A92),
//                     ),
//                   ),
//                   focusedBorder: const UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Color(0xff16A085),
//                     ),
//                   ),
//                   fillColor: Colors.grey[100],
//                   filled: true,
//                 ),
//               ),
//               const SizedBox(height: 30),
//               const Text(
//                 "Tanggal Tandur",
//                 style: TextStyle(
//                   color: Color(0xff919A92),
//                 ),
//               ),
//               TextFormField(
//                 controller: controller.plating_date,
//                 readOnly: true,
//                 cursorColor: const Color(0xff16A085),
//                 onTap: () async {
//                   DateTime? pickedDate = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(2000),
//                       lastDate: DateTime(2101));

//                   if (pickedDate != null) {
//                     String formattedDate =
//                         DateFormat('yyyy-MM-dd').format(pickedDate);
//                     controller.plating_date.text = formattedDate;
//                   } else {
//                     print("Date is not selected");
//                   }
//                 },
//                 decoration: const InputDecoration(
//                   // helperText: 'Contoh: Label',
//                   // fillColor: Color(0xff919A92),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Color(0xff919A92),
//                     ),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Color(0xff16A085),
//                     ),
//                   ),
//                   suffixIcon: Icon(
//                     Icons.date_range_rounded,
//                     color: Color(0xff919A92),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               Center(
//                 child: SizedBox(
//                   height: 46, //height of button
//                   width: 300,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       primary: const Color(0xff16A085), // background
//                     ),
//                     onPressed: () => controller.postData(
//                         controller.plant_tanaman.text,
//                         controller.surface_area.text,
//                         controller.address.text,
//                         controller.plating_date.text),
//                     child: const Text('Tambah'),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
