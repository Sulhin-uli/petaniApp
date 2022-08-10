import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:petani_app/app/data/models/education_category_model.dart';
import 'package:petani_app/app/data/models/education_model.dart';
import 'package:petani_app/app/data/models/user_model.dart';
import 'package:petani_app/app/data/providers/education_provider.dart';
import 'package:petani_app/app/routes/app_pages.dart';
import 'package:petani_app/app/utils/constant.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class EducationController extends GetxController {
  final box = GetStorage();
  var education = List<Education>.empty().obs;
  String? thumbnail;
  var isLoadingButton = true.obs;
  // var searchEducation = List<Education>.empty().obs;
  var isSearch = false.obs;
  // late TextEditingController seacrh;

  // upload image
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  // old
  var isUpload = false.obs;

  @override
  void onInit() {
    super.onInit();
    seacrh = TextEditingController();
    getData();
    // getTumbnail();
  }

  // runSearch(String enteredKeyword) {
  //   if (enteredKeyword.isNotEmpty) {
  //     var result = education.where((item) =>
  //         item.title!.toLowerCase().contains(enteredKeyword.toLowerCase()));
  //     result.map((e) {
  //       final data = Education(
  //         id: e.id,
  //         userId: User(
  //           id: e.userId!.id,
  //           name: e.userId!.name,
  //         ),
  //         categoryEducationId: EducationCategory(
  //           id: e.categoryEducationId!.id,
  //           name: e.categoryEducationId!.name,
  //         ),
  //         title: e.title,
  //         slug: e.slug,
  //         date: e.date,
  //         file: e.file,
  //         desc: e.desc,
  //       );
  //       searchEducation.add(data);
  //     }).toList();
  //   }
  // }

  // Infinityscroll
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  RefreshController refreshSearchController =
      RefreshController(initialRefresh: false);
  ScrollController controller = ScrollController();
  var page = 1.obs;

  void getData() async {
    try {
      final data = box.read("userData") as Map<String, dynamic>;
      return EducationProvider()
          .getData(page.value, data["token"])
          .then((response) {
        if (response["data"].length != 0) {
          response["data"].map((e) {
            final data = Education.fromJson(e as Map<String, dynamic>);
            education.add(data);
          }).toList();
          page.value = page.value + 1;
        } else {}
      });
    } catch (e) {
      dialogError(e.toString());
    }
  }

  void onRefresh() async {
    education.clear();
    await Future.delayed(Duration(milliseconds: 1000));
    page.value = 1;
    getData();
    refreshController.refreshCompleted();
  }

  void onLoading() {}

  void addItems() {
    getData();
  }

  // search

  late TextEditingController seacrh;
  var searchText = "".obs;
  var pageSearch = 1.obs;
  var educationSearch = List<Education>.empty().obs;

  void runSearch(String searchType) {
    if (searchType == "") {
      dialogError("Kolom tidak boleh kosong");
    } else {
      educationSearch.clear();
      pageSearch.value = 1;
      searchText.value = searchType;
      Get.toNamed(Routes.SEARCH_EDUCATION, arguments: searchType);
      // // Get.toNamed(Routes.PRODUK);
      getDataSearch();
    }
  }

  void getDataSearch() async {
    try {
      final data = box.read("userData") as Map<String, dynamic>;
      return EducationProvider()
          .getDataSearch(pageSearch.value, searchText.value, data["token"])
          .then((response) {
        // print(response);
        if (response["data"].length != 0) {
          response["data"].map((e) {
            final data = Education.fromJson(e as Map<String, dynamic>);
            educationSearch.add(data);
          }).toList();
          pageSearch.value = pageSearch.value + 1;
        } else {}
      });
    } catch (e) {
      dialogError(e.toString());
    }
  }

  void onRefreshSearch() async {
    educationSearch.clear();
    await Future.delayed(Duration(milliseconds: 1000));
    pageSearch.value = 1;
    getDataSearch();
    refreshSearchController.refreshCompleted();
  }

  void addItemsSearch() {
    getDataSearch();
  }

  // Future getData() async {
  //   final data = box.read("userData") as Map<String, dynamic>;
  //   return EducationProvider().getData(data["token"]).then((response) {
  //     try {
  //       response["data"].map((e) {
  //         final data = Education(
  //           id: e["id"],
  //           userId: User(
  //             id: e["user_id"]["id"],
  //             name: e["user_id"]["name"],
  //           ),
  //           categoryEducationId: EducationCategory(
  //             id: e["category_education_id"]["id"],
  //             name: e["category_education_id"]["name"],
  //             createdAt: e["category_education_id"]["created_at"],
  //             updatedAt: e["category_education_id"]["updated_at"],
  //           ),
  //           title: e["title"],
  //           slug: e["slug"],
  //           date: e["date"],
  //           file: e["file"],
  //           desc: e["desc"],
  //           createdAt: e["created_at"],
  //           updatedAt: e["updated_at"],
  //         );
  //         education.add(data);
  //       }).toList();
  //     } catch (e) {
  //       print("Error is : " + e.toString());
  //     }
  //   });
  // }

  // cari berdasarka id
  Education findByid(int id) {
    return education.firstWhere((element) => element.id == id);
  }
}
