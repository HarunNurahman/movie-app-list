import 'package:movieapp_javan_devtest/models/genre_model.dart';

class MovieModel {
  MovieModel({
    this.backdropPath,
    this.budget,
    this.genres,
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
  List<GenreModel>? genres;
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
        genres: List<GenreModel>.from(
          json["genres"].map((genres) => GenreModel.fromJson(genres)),
        ),
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
        "genres": List<dynamic>.from(genres!.map((genres) => genres.toJson())),
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