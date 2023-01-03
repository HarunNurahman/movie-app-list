import 'dart:convert';

import 'package:movieapp_javan_devtest/models/now-playing_model.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp_javan_devtest/models/popular_model.dart';
import 'package:movieapp_javan_devtest/models/top-rated_model.dart';
import 'package:movieapp_javan_devtest/models/upcoming_model.dart';

const apiKey = '1f8a6fdb1a03d4b7a9d53856cec57c42';

class ApiService {
  // API url
  String baseUrl = 'https://api.themoviedb.org/3/movie/';

  Future<List<NowPlayingModel>> getNowPlaying() async {
    var url = '$baseUrl/now_playing?api_key=$apiKey&language=ID';
    var response = await http.get(Uri.parse(url));
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<NowPlayingModel> nowPlaying = [];

      for (var item in data) {
        nowPlaying.add(NowPlayingModel.fromJson(item));
      }
      return nowPlaying;
    } else {
      throw Exception('Gagal Mengambil Data');
    }
  }

  Future<List<TopRatedModel>> getTopRated() async {
    var url = '$baseUrl/top_rated?api_key=$apiKey&language=ID';
    var response = await http.get(Uri.parse(url));
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<TopRatedModel> topRated = [];

      for (var item in data) {
        topRated.add(TopRatedModel.fromJson(item));
      }
      return topRated;
    } else {
      throw Exception('Gagal Mengambil Data');
    }
  }

  Future<List<PopularModel>> getPopular() async {
    var url = '$baseUrl/popular?api_key=$apiKey&language=ID';
    var response = await http.get(Uri.parse(url));
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<PopularModel> popular = [];

      for (var item in data) {
        popular.add(PopularModel.fromJson(item));
      }
      return popular;
    } else {
      throw Exception('Gagal Mengambil Data');
    }
  }

  Future<List<UpcomingModel>> getUpcoming() async {
    var url = '$baseUrl/upcoming?api_key=$apiKey&language=ID';
    var response = await http.get(Uri.parse(url));
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<UpcomingModel> upcoming = [];

      for (var item in data) {
        upcoming.add(UpcomingModel.fromJson(item));
      }
      return upcoming;
    } else {
      throw Exception('Gagal Mengambil Data');
    }
  }
}
