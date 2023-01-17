class MovieModel {
  MovieModel({
    this.backdropPath,
<<<<<<< HEAD
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
=======
    this.budget,
    this.homepage,
    this.id,
    this.overview,
>>>>>>> 0309cfdeff6ea86efd38593ca9bc85826c85ba43
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
<<<<<<< HEAD
    this.voteAverage,
    this.voteCount,
  });

  String? backdropPath;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
=======
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
>>>>>>> 0309cfdeff6ea86efd38593ca9bc85826c85ba43
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
<<<<<<< HEAD
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
=======
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
>>>>>>> 0309cfdeff6ea86efd38593ca9bc85826c85ba43
