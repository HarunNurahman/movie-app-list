import 'package:dio/dio.dart';
import 'package:movie_app_list/core/utils/api_key.dart';
import 'package:movie_app_list/core/utils/base_url.dart';
import 'package:movie_app_list/models/movie_model.dart';

class NowPlayingService {
  final dio = Dio();
  Future<List<MovieModel>> getNowPlaying() async {
    try {
      final response = await dio.get('$baseUrl/now_playing?api_key=$apiKey');
      if (response.statusCode == 200) {
        return (response.data['results'] as List)
            .map((e) => MovieModel.fromJson(e))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
