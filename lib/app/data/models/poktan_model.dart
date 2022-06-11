import 'package:petani_app/app/data/models/gapoktan_model.dart';
import 'package:petani_app/app/data/models/user_model.dart';

class Poktan {
  int? id;
  User? userId;
  Gapoktan? gapoktanId;
  String? city;
  String? address;
  int? telp;
  String? image;
  bool? isActive;

  Poktan({
    this.id,
    this.userId,
    this.gapoktanId,
    this.city,
    this.address,
    this.telp,
    this.image,
    this.isActive,
  });

  Poktan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'] != null ? User.fromJson(json['user_id']) : null;
    gapoktanId = json['gapoktan_id'] != null
        ? Gapoktan.fromJson(json['gapoktan_id'])
        : null;
    city = json['city'];
    address = json['address'];
    telp = json['telp'];
    image = json['image'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (userId != null) {
      data['user_id'] = userId!.toJson();
    }
    if (userId != null) {
      data['gapoktan_id'] = gapoktanId!.toJson();
    }
    data['city'] = city;
    data['address'] = address;
    data['telp'] = telp;
    data['image'] = image;
    data['is_active'] = isActive;
    return data;
  }
}
