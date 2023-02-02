import 'package:dio/dio.dart';
import 'package:movieapp_javan_devtest/models/detail-movie_model.dart';
import 'package:movieapp_javan_devtest/models/genre_model.dart';
import 'package:movieapp_javan_devtest/models/movie_model.dart';

class ApiService {
  final Dio _dio = Dio();

  final String baseUrl = 'https://api.themoviedb.org/3/';
  final String apiKey = 'api_key=1f8a6fdb1a03d4b7a9d53856cec57c42';

  // GET Detail Movie API
  Future<DetailMovieModel> getMovieDetail(int movieId) async {
    try {
      final response = await _dio.get('$baseUrl/movie/$movieId?$apiKey');
      DetailMovieModel detailMovie = DetailMovieModel.fromJson(response.data);

      // detailMovie.genreModel = await getGenreList(movieId);
      detailMovie.trailerId = await getYoutubeId(movieId);

      return detailMovie;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // GET Now Playing API
  Future<List<MovieModel>> getNowPlayingMovie() async {
    try {
      final response = await _dio.get('$baseUrl/movie/now_playing?$apiKey');
      var nowPlaying = response.data['results'] as List;
      List<MovieModel> npList =
          nowPlaying.map((e) => MovieModel.fromJson(e)).toList();
      return npList;
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  // GET Top Rated Movie API
  Future<List<MovieModel>> getTopRatedMovie() async {
    try {
      final response = await _dio.get('$baseUrl/movie/top_rated?$apiKey');
      var topRated = response.data['results'] as List;
      List<MovieModel> trList =
          topRated.map((e) => MovieModel.fromJson(e)).toList();
      return trList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // GET Popular Movie API
  Future<List<MovieModel>> getPopularMovie() async {
    try {
      final response = await _dio.get('$baseUrl/movie/popular?$apiKey');
      var popular = response.data['results'] as List;
      List<MovieModel> popularList =
          popular.map((e) => MovieModel.fromJson(e)).toList();

      return popularList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // GET Upcoming Movie API
  Future<List<MovieModel>> getUpcomingMovie() async {
    try {
      final response = await _dio.get('$baseUrl/movie/upcoming?$apiKey');
      var upcoming = response.data['results'] as List;
      List<MovieModel> upcomingList =
          upcoming.map((e) => MovieModel.fromJson(e)).toList();
      return upcomingList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // GET Genre List API
  Future<List<GenreModel>> getGenreList() async {
    try {
      final response = await _dio.get(
        '$baseUrl/genre/movie/list?$apiKey&language=en-US',
      );
      var genres = response.data['genres'] as List;
      List<GenreModel> genreList =
          genres.map((e) => GenreModel.fromJson(e)).toList();
      return genreList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // GET Video or Trailer ID API
  Future<String> getYoutubeId(int id) async {
    try {
      final response = await _dio.get('$baseUrl/movie/$id/videos?$apiKey');
      var youtubeID = response.data['results'][0]['key'];
      return youtubeID;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // GET Search Movie API
  Future<List<MovieModel>> getSearchResult(String query) async {
    try {
      final response = await _dio.get(
          '$baseUrl/search/movie?query=$query&$apiKey&language=en-US&page=1');
      var search = response.data['results'] as List;
      List<MovieModel> searchResult =
          search.map((e) => MovieModel.fromJson(e)).toList();
      return searchResult;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
