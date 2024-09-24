import 'package:dio/dio.dart';
import 'package:movie_app_list/core/utils/api_key.dart';
import 'package:movie_app_list/core/utils/base_url.dart';
import 'package:movie_app_list/models/movie_model.dart';

class NowPlayingService {
  final dio = Dio();
  Future<List<MovieModel>> getNowPlaying() async {
    try {
      final response = await dio.get(
        '$baseUrl/now_playing',
        queryParameters: {'api_key': apiKey},
      );
      if (response.statusCode == 200) {
        return List<MovieModel>.from(
          response.data['results'].map((x) => MovieModel.fromJson(x)),
        );
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Error Occured: ${e.toString()}');
    }
  }
}
