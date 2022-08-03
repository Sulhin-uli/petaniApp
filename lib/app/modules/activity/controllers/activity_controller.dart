import 'package:flutter/material.dart';
import 'package:petani_app/app/data/models/activity_category_model.dart';
import 'package:petani_app/app/data/models/activity_model.dart';
import 'package:petani_app/app/data/models/user_model.dart';
import 'package:petani_app/app/data/providers/activity_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ActivityController extends GetxController {
  final box = GetStorage();
  // list education
  var activity = List<Activity>.empty().obs;
  String selectedDate = "";
  var searchActivity = List<Activity>.empty().obs;
  var isSearch = false.obs;
  late TextEditingController seacrh;

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

  // get data
  Future getData() async {
    final data = box.read("userData") as Map<String, dynamic>;
    return ActivityProvider().getData(data["token"]).then((response) {
      try {
        response["data"].map((e) {
          // final data = Activity(
          //   id: e["id"],
          //   userId: User(
          //     id: e["user_id"]["id"],
          //     name: e["user_id"]["name"],
          //   ),
          //   categoryActivityId: ActivityCategory(
          //     id: e["category_activity_id"]["id"],
          //     name: e["category_activity_id"]["name"],
          //     createdAt: e["category_activity_id"]["created_at"],
          //     updatedAt: e["category_activity_id"]["updated_at"],
          //   ),
          //   title: e["title"],
          //   slug: e["slug"],
          //   date: e["date"],
          //   desc: e["desc"],
          //   createdAt: e["created_at"],
          //   updatedAt: e["updated_at"],
          // );
          final data = Activity.fromJson(e as Map<String, dynamic>);
          activity.add(data);
        }).toList();
      } catch (e) {
        // Get.toNamed(Routes.ERROR, arguments: e.toString());
        print("Error is : " + e.toString());
      }
    });
  }

  // cari berdasarka id
  Activity findByid(int id) {
    return activity.firstWhere((element) => element.id == id);
  }
}
