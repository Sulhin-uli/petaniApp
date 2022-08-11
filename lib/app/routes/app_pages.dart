import 'package:get/get.dart';
import 'package:petani_app/app/modules/activity/bindings/activity_binding.dart';
import 'package:petani_app/app/modules/activity/views/detail_activity_view.dart';
import 'package:petani_app/app/modules/activity/views/index_activity_view.dart';
import 'package:petani_app/app/modules/activity/views/search_activity_view.dart';
import 'package:petani_app/app/modules/education/bindings/education_binding.dart';
import 'package:petani_app/app/modules/education/views/detail_education_view.dart';
import 'package:petani_app/app/modules/education/views/index_education_view.dart';
import 'package:petani_app/app/modules/education/views/search_education_view.dart';
import 'package:petani_app/app/modules/forget_password/bindings/forget_password_binding.dart';
import 'package:petani_app/app/modules/forget_password/views/forget_password_view.dart';
import 'package:petani_app/app/modules/history_plant/views/detail_history_plant_view.dart';
import 'package:petani_app/app/modules/history_plant/views/history_plant_view.dart';
import 'package:petani_app/app/modules/home/views/index_home_view.dart';
import 'package:petani_app/app/modules/login/views/check_auth_view.dart';
import 'package:petani_app/app/modules/notifikasi/bindings/notifikasi_binding.dart';
import 'package:petani_app/app/modules/notifikasi/views/index_notifikasi_view.dart';
import 'package:petani_app/app/modules/panen/views/add_panen_view.dart';
import 'package:petani_app/app/modules/panen/views/detail_panen_view.dart';
import 'package:petani_app/app/modules/panen/views/edit_panen_view.dart';
import 'package:petani_app/app/modules/panen/views/index_panen_view.dart';
import 'package:petani_app/app/modules/saya/bindings/saya_binding.dart';
import 'package:petani_app/app/modules/saya/views/edit_password_view.dart';
import 'package:petani_app/app/modules/saya/views/edit_profile_view.dart';
import 'package:petani_app/app/modules/saya/views/index_saya_view.dart';
import 'package:petani_app/app/modules/saya/views/information_account.dart';
import 'package:petani_app/app/modules/tandur/bindings/tandur_binding.dart';
import 'package:petani_app/app/modules/tandur/views/add_date_tandur_view.dart';
import 'package:petani_app/app/modules/tandur/views/add_harvest_date_view.dart';
import 'package:petani_app/app/modules/tandur/views/add_tandur_view.dart';
import 'package:petani_app/app/modules/tandur/views/detail_tandur_view.dart';
import 'package:petani_app/app/modules/tandur/views/edit_tandur_view.dart';
import 'package:petani_app/app/modules/tandur/views/index_tandur_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.CHECK_AUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => IndexHomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CHECK_AUTH,
      page: () => CheckAuthView(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),

    // Edukasi
    GetPage(
      name: _Paths.INDEX_EDUCATION,
      page: () => IndexEducationView(),
      binding: EducationBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_EDUCATION,
      page: () => DetailEducationView(),
      binding: EducationBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_EDUCATION,
      page: () => SearchEducationView(),
      binding: EducationBinding(),
    ),

    // Kegiatan
    GetPage(
      name: _Paths.INDEX_ACTIVITY,
      page: () => IndexActivityView(),
      binding: ActivityBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ACTIVITY,
      page: () => DetailActivityView(),
      binding: ActivityBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_ACTIVITY,
      page: () => SearchActivityView(),
      binding: ActivityBinding(),
    ),

    // History PLant
    GetPage(
      name: _Paths.HISTORY_PLANT,
      page: () => HistoryPlantView(),
      binding: TandurBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_HISTORY_PLANT,
      page: () => DetailHistoryPlantView(),
      binding: TandurBinding(),
    ),

    /////////////////////

    // Tandur
    GetPage(
      name: _Paths.INDEX_TANDUR,
      page: () => IndexTandurView(),
      binding: TandurBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_TANDUR,
      page: () => DetailTandurView(),
      binding: TandurBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TANDUR,
      page: () => AddTandurView(),
      binding: TandurBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_TANDUR,
      page: () => EditTandurView(),
      binding: TandurBinding(),
    ),
    GetPage(
      name: _Paths.ADD_HARVEST_DATE,
      page: () => AddHarvestDateView(),
      binding: TandurBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PLANT_DATE,
      page: () => AddDateTandurView(),
      binding: TandurBinding(),
    ),

    // Panen
    GetPage(
      name: _Paths.INDEX_PANEN,
      page: () => IndexPanenView(),
      binding: TandurBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PANEN,
      page: () => DetailPanenView(),
      binding: TandurBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PANEN,
      page: () => AddPanenView(),
      // binding: PRODUKBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PANEN,
      page: () => EditPanenView(),
      binding: TandurBinding(),
    ),

    // Saya
    GetPage(
      name: _Paths.INDEX_SAYA,
      page: () => IndexSayaView(),
      binding: SayaBinding(),
    ),

    // SAYA
    GetPage(
      name: _Paths.INDEX_SAYA,
      page: () => IndexSayaView(),
      binding: SayaBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfileView(),
      binding: SayaBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PASSWORD,
      page: () => EditPasswordView(),
      binding: SayaBinding(),
    ),
    GetPage(
      name: _Paths.INFORMATION_ACCOUNT,
      page: () => InformationAccountView(),
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
