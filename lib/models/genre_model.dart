class GenreModel {
  int? id;
  String? name;

  GenreModel({this.id, this.name});

  factory GenreModel.fromJson(dynamic json) => GenreModel(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
