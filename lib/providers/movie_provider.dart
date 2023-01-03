import 'package:flutter/cupertino.dart';
import 'package:movieapp_javan_devtest/models/now-playing_model.dart';
import 'package:movieapp_javan_devtest/models/top-rated_model.dart';
import 'package:movieapp_javan_devtest/services/api_service.dart';

class MovieProvider with ChangeNotifier {
  // Now Playing
  List<NowPlayingModel> _nowPlaying = [];
  List<NowPlayingModel> get nowPlaying => _nowPlaying;

  // Top Rated
  List<TopRatedModel> _topRated = [];
  List<TopRatedModel> get topRated => _topRated;

  set nowPlaying(List<NowPlayingModel> movie) {
    _nowPlaying = nowPlaying;
    notifyListeners();
  }

  Future<void> getNowPlaying() async {
    try {
      List<NowPlayingModel> nowPlaying = await ApiService().getNowPlaying();
      _nowPlaying = nowPlaying;
    } catch (e) {
      print(e);
    }
  }

  // Top Rated Provider
  set topRated(List<TopRatedModel> movie) {
    _topRated = topRated;
    notifyListeners();
  }

  Future<void> getTopRated() async {
    try {
      List<TopRatedModel> topRated = await ApiService().getTopRated();
      _topRated = topRated;
    } catch (e) {
      print(e);
    }
  }
}
