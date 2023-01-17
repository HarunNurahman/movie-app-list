<<<<<<< HEAD
import 'package:dio/dio.dart';
import 'package:movieapp_javan_devtest/models/movie_model.dart';

class ApiService {
  final Dio _dio = Dio();

  final String baseUrl = 'https://api.themoviedb.org/3/';
  final String apiKey = 'api_key=1f8a6fdb1a03d4b7a9d53856cec57c42';

  Future<List<MovieModel>> getNowPlayingMovie() async {
    try {
      print('Now Playing API Called');

      final response =
          await _dio.get('$baseUrl/movie/now_playing?$apiKey&page=1');
      var nowPlaying = response.data['results'] as List;
      List<MovieModel> npList =
          nowPlaying.map((e) => MovieModel.fromJson(e)).toList();
      return npList;
    } catch (e) {
      print(e);
      throw Exception(e);
=======
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieapp_javan_devtest/models/movie_model.dart';

class ApiService {
  // API url
  String baseUrl = 'https://api.themoviedb.org/3/movie/';
  String apiKey = 'api_key=1f8a6fdb1a03d4b7a9d53856cec57c42';
  String region = 'language=ID';

  Future<List<MovieModel>> getMovieDetail(int movieId) async {
    var url = '$baseUrl/$movieId?$apiKey';
    var response = await http.get(Uri.parse(url));
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<MovieModel> movieDetail = [];

      for (var item in data) {
        movieDetail.add(MovieModel.fromJson(item));
      }
      return movieDetail;
    } else {
      throw Exception('Gagal Mengambil Data');
    }
  }

  Future<List<MovieModel>> getNowPlaying() async {
    var url = '$baseUrl/now_playing?$apiKey&$region';
    var response = await http.get(Uri.parse(url));
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<MovieModel> nowPlaying = [];

      for (var item in data) {
        nowPlaying.add(MovieModel.fromJson(item));
      }
      return nowPlaying;
    } else {
      throw Exception('Gagal Mengambil Data');
    }
  }

  Future<List<MovieModel>> getTopRated() async {
    var url = '$baseUrl/top_rated?$apiKey&$region';
    var response = await http.get(Uri.parse(url));
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<MovieModel> topRated = [];

      for (var item in data) {
        topRated.add(MovieModel.fromJson(item));
      }
      return topRated;
    } else {
      throw Exception('Gagal Mengambil Data');
    }
  }

  Future<List<MovieModel>> getPopular() async {
    var url = '$baseUrl/popular?$apiKey&$region';
    var response = await http.get(Uri.parse(url));
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<MovieModel> popular = [];

      for (var item in data) {
        popular.add(MovieModel.fromJson(item));
      }
      return popular;
    } else {
      throw Exception('Gagal Mengambil Data');
    }
  }

  Future<List<MovieModel>> getUpcoming() async {
    var url = '$baseUrl/upcoming?$apiKey&$region';
    var response = await http.get(Uri.parse(url));
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<MovieModel> upcoming = [];

      for (var item in data) {
        upcoming.add(MovieModel.fromJson(item));
      }
      return upcoming;
    } else {
      throw Exception('Gagal Mengambil Data');
>>>>>>> 0309cfdeff6ea86efd38593ca9bc85826c85ba43
    }
  }
}
