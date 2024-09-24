import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_list/core/services/now-playing_service.dart';
import 'package:movie_app_list/models/movie_model.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlaying extends Bloc<NowPlayingEvent, NowPlayingState> {
  NowPlaying() : super(NowPlayingInitial()) {
    on<NowPlayingEvent>((event, emit) async {
      if (event is GetNowPlaying) {
        try {
          emit(NowPlayingLoading());
          final result = await NowPlayingService().getNowPlaying();
          emit(NowPlayingLoaded(result));
        } catch (e) {
          emit(NowPlayingFailed(e.toString()));
        }
      }
    });
  }
}
