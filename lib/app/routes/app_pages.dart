import 'package:get/get.dart';
import 'package:petani_app/app/modules/edukasi/bindings/edukasi_binding.dart';
import 'package:petani_app/app/modules/edukasi/views/detail_edukasi_view.dart';
import 'package:petani_app/app/modules/edukasi/views/index_edukasi_view.dart';
import 'package:petani_app/app/modules/kegiatan/bindings/kegiatan_binding.dart';
import 'package:petani_app/app/modules/kegiatan/views/detail_kegiatan_view.dart';
import 'package:petani_app/app/modules/kegiatan/views/index_kegiatan_view.dart';
import 'package:petani_app/app/modules/notifikasi/bindings/notifikasi_binding.dart';
import 'package:petani_app/app/modules/notifikasi/views/index_notifikasi_view.dart';
import 'package:petani_app/app/modules/panen/bindings/panen_binding.dart';
import 'package:petani_app/app/modules/panen/views/add_panen_view.dart';
import 'package:petani_app/app/modules/panen/views/detail_panen_view.dart';
import 'package:petani_app/app/modules/panen/views/edit_panen_view.dart';
import 'package:petani_app/app/modules/panen/views/index_panen_view.dart';
import 'package:petani_app/app/modules/saya/bindings/saya_binding.dart';
import 'package:petani_app/app/modules/saya/views/index_saya_view.dart';
import 'package:petani_app/app/modules/tandur/bindings/tandur_binding.dart';
import 'package:petani_app/app/modules/tandur/views/add_tandur_view.dart';
import 'package:petani_app/app/modules/tandur/views/detail_tandur_view.dart';
import 'package:petani_app/app/modules/tandur/views/edit_tandur_view.dart';
import 'package:petani_app/app/modules/tandur/views/index_tandur_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),

    // Edukasi
    GetPage(
      name: _Paths.INDEX_EDUKASI,
      page: () => IndexEdukasiView(),
      binding: EdukasiBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_EDUKASI,
      page: () => DetailEdukasiView(),
      binding: EdukasiBinding(),
    ),

    // Kegiatan
    GetPage(
      name: _Paths.INDEX_KEGIATAN,
      page: () => IndexKegiatanView(),
      // binding: ProdukBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_KEGIATAN,
      page: () => DetailKegiatanView(),
      binding: KegiatanBinding(),
    ),

    // Tandur
    GetPage(
      name: _Paths.INDEX_TANDUR,
      page: () => IndexTandurView(),
      binding: TandurBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_TANDUR,
      page: () => DetailTandurView(),
      // binding: ProdukBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TANDUR,
      page: () => AddTandurView(),
      // binding: PRODUKBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_TANDUR,
      page: () => EditTandurView(),
      // binding: EdukasiBinding(),
    ),

    // Panen
    GetPage(
      name: _Paths.INDEX_PANEN,
      page: () => IndexPanenView(),
      binding: PanenBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PANEN,
      page: () => DetailPanenView(),
      // binding: ProdukBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PANEN,
      page: () => AddPanenView(),
      // binding: PRODUKBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PANEN,
      page: () => EditPanenView(),
      // binding: EdukasiBinding(),
    ),

    // Saya
    GetPage(
      name: _Paths.INDEX_SAYA,
      page: () => IndexSayaView(),
      binding: SayaBinding(),
    ),

    // Notifikasi
    GetPage(
      name: _Paths.INDEX_NOTIFIKASI,
      page: () => IndexNotifikasiView(),
      binding: NotifikasiBinding(),
    ),
  ];
}
