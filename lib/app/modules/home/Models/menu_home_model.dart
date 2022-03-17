import 'package:flutter/cupertino.dart';

class MenuHome {
  String? id;
  String? image;
  String? title;
  Color? color;
  String? route;

  MenuHome({this.id, this.image, this.title, this.color, this.route});

  MenuHome.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    color = json['color'];
    route = json['route'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['title'] = title;
    data['color'] = color;
    data['route'] = route;
    return data;
  }
}
