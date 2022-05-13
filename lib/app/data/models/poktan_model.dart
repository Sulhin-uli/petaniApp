class Poktan {
  int? id;
  String? chairman;

  Poktan({this.id, this.chairman});

  Poktan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chairman = json['chairman'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['chairman'] = chairman;
    return data;
  }
}
