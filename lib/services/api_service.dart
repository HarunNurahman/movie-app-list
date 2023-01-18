import 'package:dio/dio.dart';
import 'package:movieapp_javan_devtest/models/movie_model.dart';

class ApiService {
  final Dio _dio = Dio();

  final String baseUrl = 'https://api.themoviedb.org/3/';
  final String apiKey = 'api_key=1f8a6fdb1a03d4b7a9d53856cec57c42';

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
}
