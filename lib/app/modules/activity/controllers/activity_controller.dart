import 'package:flutter/material.dart';
import 'package:petani_app/app/data/models/activity_model.dart';
import 'package:petani_app/app/data/providers/activity_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:petani_app/app/utils/constant.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ActivityController extends GetxController {
  final box = GetStorage();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  ScrollController controller = ScrollController();
  // list education
  String selectedDate = "";
  var searchActivity = List<Activity>.empty().obs;
  var isSearch = false.obs;
  late TextEditingController seacrh;
  // infinity scroll
  var activity = List<Activity>.empty().obs;
  var page = 1.obs;

  // get data

  void getData() async {
    try {
      final data = box.read("userData") as Map<String, dynamic>;
      return ActivityProvider()
          .getData(page.value, data["token"])
          .then((response) {
        if (response["data"].length != 0) {
          response["data"].map((e) {
            final data = Activity.fromJson(e as Map<String, dynamic>);
            activity.add(data);
          }).toList();
          page.value = page.value + 1;
        } else {}
      });
    } catch (e) {
      dialogError(e.toString());
    }
  }

  void onRefresh() async {
    activity.clear();
    await Future.delayed(Duration(milliseconds: 1000));
    page.value = 1;
    getData();
    refreshController.refreshCompleted();
  }

  void onLoading() {}

  void addItems() {
    getData();
  }

  // Future getData() async {
  //   final data = box.read("userData") as Map<String, dynamic>;
  //   return ActivityProvider()
  //       .getData(page.value, data["token"])
  //       .then((response) {
  //     try {
  //       response["data"].map((e) {
  //         // final data = Activity(
  //         //   id: e["id"],
  //         //   userId: User(
  //         //     id: e["user_id"]["id"],
  //         //     name: e["user_id"]["name"],
  //         //   ),
  //         //   categoryActivityId: ActivityCategory(
  //         //     id: e["category_activity_id"]["id"],
  //         //     name: e["category_activity_id"]["name"],
  //         //     createdAt: e["category_activity_id"]["created_at"],
  //         //     updatedAt: e["category_activity_id"]["updated_at"],
  //         //   ),
  //         //   title: e["title"],
  //         //   slug: e["slug"],
  //         //   date: e["date"],
  //         //   desc: e["desc"],
  //         //   createdAt: e["created_at"],
  //         //   updatedAt: e["updated_at"],
  //         // );
  //         final data = Activity.fromJson(e as Map<String, dynamic>);
  //         activity.add(data);
  //       }).toList();
  //     } catch (e) {
  //       // Get.toNamed(Routes.ERROR, arguments: e.toString());
  //       print("Error is : " + e.toString());
  //     }
  //   });
  // }

  @override
  void onInit() {
    getData();
    seacrh = TextEditingController();
    super.onInit();
  }

  runSearch(String enteredKeyword) {
    if (enteredKeyword.isNotEmpty) {
      var result = activity.where((item) =>
          item.title!.toLowerCase().contains(enteredKeyword.toLowerCase()));
      result.map((e) {
        final data = Activity.fromJson(e as Map<String, dynamic>);
        searchActivity.add(data);
      }).toList();
    }
  }

  // cari berdasarka id
  Activity findByid(int id) {
    return activity.firstWhere((element) => element.id == id);
  }
}
