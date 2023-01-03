class TopRatedModel {
  TopRatedModel({
    this.genreIds,
    this.id,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
  });

  List<int>? genreIds;
  int? id;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;

  factory TopRatedModel.fromJson(Map<String, dynamic> json) => TopRatedModel(
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "overview": overview,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "title": title,
      };
}
