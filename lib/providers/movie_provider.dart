import 'package:flutter/cupertino.dart';
import 'package:movieapp_javan_devtest/models/now-playing_model.dart';
import 'package:movieapp_javan_devtest/models/popular_model.dart';
import 'package:movieapp_javan_devtest/models/top-rated_model.dart';
import 'package:movieapp_javan_devtest/models/upcoming_model.dart';
import 'package:movieapp_javan_devtest/services/api_service.dart';

class MovieProvider with ChangeNotifier {
  // // Now Playing // //
  // Now Playing Getter and Setter
  List<NowPlayingModel> _nowPlaying = [];
  List<NowPlayingModel> get nowPlaying => _nowPlaying;

  set nowPlaying(List<NowPlayingModel> movie) {
    _nowPlaying = nowPlaying;
    notifyListeners();
  }

  // Function get now playing data
  Future<void> getNowPlaying() async {
    try {
      List<NowPlayingModel> nowPlaying = await ApiService().getNowPlaying();
      _nowPlaying = nowPlaying;
    } catch (e) {
      print(e);
    }
  }
  // ================== //

  // // Top Rated // //
  // Top Rated Getter and Setter
  List<TopRatedModel> _topRated = [];
  List<TopRatedModel> get topRated => _topRated;

  set topRated(List<TopRatedModel> movie) {
    _topRated = topRated;
    notifyListeners();
  }

  // Function get top rated movie
  Future<void> getTopRated() async {
    try {
      List<TopRatedModel> topRated = await ApiService().getTopRated();
      _topRated = topRated;
    } catch (e) {
      print(e);
    }
  }
  // ================== //

  // // Popular Movie // //
  // Popular Movie Getter and Setter
  List<PopularModel> _popular = [];
  List<PopularModel> get popular => _popular;

  set popular(List<PopularModel> movie) {
    _popular = popular;
    notifyListeners();
  }

  // Function get popular movie
  Future<void> getPopular() async {
    try {
      List<PopularModel> popular = await ApiService().getPopular();
      _popular = popular;
    } catch (e) {
      print(e);
    }
  }
  // ================== //

  // // Upcoming Movie // //
  // Upcoming Movie Getter and Setter
  List<UpcomingModel> _upcoming = [];
  List<UpcomingModel> get upcoming => _upcoming;

  set upcoming(List<UpcomingModel> movie) {
    _upcoming = upcoming;
    notifyListeners();
  }

  // Function get upcoming movie
  Future<void> getUpcoming() async {
    try {
      List<UpcomingModel> upcoming = await ApiService().getUpcoming();
      _upcoming = upcoming;
    } catch (e) {
      print(e);
    }
  }
}
