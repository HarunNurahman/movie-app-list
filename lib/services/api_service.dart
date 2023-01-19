import 'package:dio/dio.dart';
import 'package:movieapp_javan_devtest/models/detail-movie_model.dart';
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

      return detailMovie;
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  // GET Now Playing API
  Future<List<MovieModel>> getNowPlayingMovie() async {
    try {
      print('Now Playing API Called');

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
      print('Top Rated API Called');

      final response = await _dio.get('$baseUrl/movie/top_rated?$apiKey');
      var topRated = response.data['results'] as List;
      List<MovieModel> trList =
          topRated.map((e) => MovieModel.fromJson(e)).toList();
      return trList;
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  // GET Popular Movie API
  Future<List<MovieModel>> getPopularMovie() async {
    try {
      print('Popular API Called');

      final response = await _dio.get('$baseUrl/movie/popular?$apiKey');
      var topRated = response.data['results'] as List;
      List<MovieModel> trList =
          topRated.map((e) => MovieModel.fromJson(e)).toList();
      return trList;
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  // GET Upcoming Movie API
  Future<List<MovieModel>> getUpcomingMovie() async {
    try {
      print('Upcoming API Called');
      final response = await _dio.get('$baseUrl/movie/upcoming?$apiKey');
      var upcoming = response.data['results'] as List;
      List<MovieModel> upcomingList =
          upcoming.map((e) => MovieModel.fromJson(e)).toList();
      return upcomingList;
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }
}
