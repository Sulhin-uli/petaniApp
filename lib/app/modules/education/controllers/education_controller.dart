import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:petani_app/app/data/models/education_category_model.dart';
import 'package:petani_app/app/data/models/education_model.dart';
import 'package:petani_app/app/data/models/user_model.dart';
import 'package:petani_app/app/data/providers/education_provider.dart';

class EducationController extends GetxController {
  final box = GetStorage();
  var education = List<Education>.empty().obs;
  late TextEditingController category_education_id;
  late TextEditingController title;
  late TextEditingController desc;
  String? thumbnail;
  var isLoadingButton = true.obs;

  // upload image
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  // old
  var isUpload = false.obs;

  @override
  void onInit() {
    super.onInit();
    category_education_id = TextEditingController();
    title = TextEditingController();
    desc = TextEditingController();
    getData();
    // getTumbnail();
  }

  // get data
  Future getData() async {
    final data = box.read("userData") as Map<String, dynamic>;
    return EducationProvider().getData(data["token"]).then((response) {
      try {
        response["data"].map((e) {
          final data = Education(
            id: e["id"],
            userId: User(
              id: e["user_id"]["id"],
              name: e["user_id"]["name"],
            ),
            categoryEducationId: EducationCategory(
              id: e["category_education_id"]["id"],
              name: e["category_education_id"]["name"],
              createdAt: e["category_education_id"]["created_at"],
              updatedAt: e["category_education_id"]["updated_at"],
            ),
            title: e["title"],
            slug: e["slug"],
            date: e["date"],
            file: e["file"],
            desc: e["desc"],
            createdAt: e["created_at"],
            updatedAt: e["updated_at"],
          );
          education.add(data);
        }).toList();
      } catch (e) {
        print("Error is : " + e.toString());
      }
    });
  }

  // cari berdasarka id
  Education findByid(int id) {
    return education.firstWhere((element) => element.id == id);
  }
}
