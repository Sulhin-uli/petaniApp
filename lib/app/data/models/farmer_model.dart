import 'package:petani_app/app/data/models/poktan_model.dart';
import 'package:petani_app/app/data/models/user_model.dart';

class Farmer {
  int? id;
  User? userId;
  Poktan? poktanId;
  String? city;

  Farmer({this.id, this.userId, this.poktanId, this.city});

  Farmer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'] != null ? User?.fromJson(json['user_id']) : null;
    poktanId =
        json['poktan_id'] != null ? Poktan?.fromJson(json['poktan_id']) : null;
    city = json['city'];
}

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (userId != null) {
      data['user_id'] = userId?.toJson();
    }
    if (poktanId != null) {
      data['poktan_id'] = poktanId?.toJson();
    }
    data['city'] = city;
    return data;
  }
}
