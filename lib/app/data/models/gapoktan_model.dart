import 'package:petani_app/app/data/models/user_model.dart';

class Gapoktan {
  int? id;
  User? userId;
  String? chairman;
  String? city;
  String? address;
  String? telp;
  String? image;

  Gapoktan({
    this.id,
    this.userId,
    this.chairman,
    this.city,
    this.address,
    this.telp,
    this.image,
  });

  Gapoktan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'] != null ? User.fromJson(json['user_id']) : null;
    chairman = json['chairman'];
    city = json['city'];
    address = json['address'];
    telp = json['telp'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (userId != null) {
      data['user_id'] = userId!.toJson();
    }
    data['chairman'] = chairman;
    data['city'] = city;
    data['address'] = address;
    data['telp'] = telp;
    data['image'] = image;
    return data;
  }
}
