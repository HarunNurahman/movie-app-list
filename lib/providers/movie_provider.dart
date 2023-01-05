import 'package:flutter/cupertino.dart';
import 'package:movieapp_javan_devtest/models/movie_model.dart';
import 'package:movieapp_javan_devtest/services/api_service.dart';

class MovieProvider with ChangeNotifier {
  // // Now Playing // //
  // Now Playing Getter and Setter
  List<MovieModel> _nowPlaying = [];
  List<MovieModel> get nowPlaying => _nowPlaying;

  set nowPlaying(List<MovieModel> movie) {
    _nowPlaying = nowPlaying;
    notifyListeners();
  }

  // Function get now playing data
  Future<void> getNowPlaying() async {
    try {
      List<MovieModel> nowPlaying = await ApiService().getNowPlaying();
      _nowPlaying = nowPlaying;
    } catch (e) {
      print(e);
    }
  }
  // ================== //

  // // Top Rated // //
  // Top Rated Getter and Setter
  List<MovieModel> _topRated = [];
  List<MovieModel> get topRated => _topRated;

  set topRated(List<MovieModel> movie) {
    _topRated = topRated;
    notifyListeners();
  }

  // Function get top rated movie
  Future<void> getTopRated() async {
    try {
      List<MovieModel> topRated = await ApiService().getTopRated();
      _topRated = topRated;
    } catch (e) {
      print(e);
    }
  }
  // ================== //

  // // Popular Movie // //
  // Popular Movie Getter and Setter
  List<MovieModel> _popular = [];
  List<MovieModel> get popular => _popular;

  set popular(List<MovieModel> movie) {
    _popular = popular;
    notifyListeners();
  }

  // Function get popular movie
  Future<void> getPopular() async {
    try {
      List<MovieModel> popular = await ApiService().getPopular();
      _popular = popular;
    } catch (e) {
      print(e);
    }
  }
  // ================== //

  // // Upcoming Movie // //
  // Upcoming Movie Getter and Setter
  List<MovieModel> _upcoming = [];
  List<MovieModel> get upcoming => _upcoming;

  set upcoming(List<MovieModel> movie) {
    _upcoming = upcoming;
    notifyListeners();
  }

  // Function get upcoming movie
  Future<void> getUpcoming() async {
    try {
      List<MovieModel> upcoming = await ApiService().getUpcoming();
      _upcoming = upcoming;
    } catch (e) {
      print(e);
    }
  }
}
