import 'package:movieapp_javan_devtest/models/genre_model.dart';

class DetailMovieModel {
  DetailMovieModel({
    this.backdropPath,
    this.budget,
    this.homepage,
    this.id,
    this.originalTitle,
    this.overview,
    this.releaseDate,
    this.posterPath,
    this.runtime,
    this.title,
    this.voteAverage,
    this.voteCount,
  });

  String? backdropPath;
  int? budget;
  String? homepage;
  int? id;
  String? originalTitle;
  String? overview;
  String? releaseDate;
  String? posterPath;
  int? runtime;
  String? title;
  double? voteAverage;
  int? voteCount;

  List<GenreModel>? genreModel;

  // String? trailerId;
  // MovieImageModel? movieImage;
  // List<CastModel>? castList;

  factory DetailMovieModel.fromJson(Map<String, dynamic> json) =>
      DetailMovieModel(
        backdropPath: json["backdrop_path"],
        budget: json["budget"],
        homepage: json["homepage"],
        id: json["id"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        releaseDate: json["release_date"],
        posterPath: json["poster_path"],
        runtime: json["runtime"],
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "budget": budget,
        "homepage": homepage,
        "id": id,
        "original_title": originalTitle,
        "overview": overview,
        "release_date": releaseDate,
        "poster_path": posterPath,
        "runtime": runtime,
        "title": title,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
