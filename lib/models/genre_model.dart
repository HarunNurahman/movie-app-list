class GenreModel {
  int? id;
  String? name;

  GenreModel({this.id, this.name});

  factory GenreModel.fromJson(dynamic json) {
    return GenreModel(id: json['id'], name: json['name']);
  }
}
