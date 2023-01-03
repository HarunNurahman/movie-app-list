import 'package:flutter/cupertino.dart';
import 'package:movieapp_javan_devtest/models/now-playing_model.dart';
import 'package:movieapp_javan_devtest/services/now-playing_services.dart';

class NowPlayingProvider with ChangeNotifier {
  List<NowPlayingModel> _nowPlaying = [];
  List<NowPlayingModel> get nowPlaying => _nowPlaying;

  set nowPlaying(List<NowPlayingModel> nowPlaying) {
    _nowPlaying = nowPlaying;
    notifyListeners();
  }

  Future<void> getNowPlaying() async {
    try {
      List<NowPlayingModel> nowPlaying =
          await NowPlayingService().getNowPlaying();
      _nowPlaying = nowPlaying;
    } catch (e) {
      print(e);
    }
  }
}
