import 'package:dio/dio.dart';
import 'package:movie_app_list/core/utils/api_key.dart';
import 'package:movie_app_list/core/utils/base_url.dart';
import 'package:movie_app_list/models/now-playing_model.dart';

class NowPlayingService {
  final dio = Dio();
  Future<NowPlayingModel> getNowPlaying() async {
    try {
      final response = await dio.get(
        '$baseUrl/now_playing?api_key=$apiKey&page=1',
      );

      if (response.statusCode == 200) {
        return NowPlayingModel.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
