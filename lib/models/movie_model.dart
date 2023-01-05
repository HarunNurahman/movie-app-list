class MovieModel {
  MovieModel({
    this.backdropPath,
    this.budget,
    this.homepage,
    this.id,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
  });

  String? backdropPath;
  int? budget;
  String? homepage;
  int? id;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        backdropPath: json["backdrop_path"],
        budget: json["budget"],
        homepage: json["homepage"],
        id: json["id"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
        video: json["video"],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "budget": budget,
        "homepage": homepage,
        "id": id,
        "overview": overview,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "title": title,
        "video": video,
      };
}
// "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",