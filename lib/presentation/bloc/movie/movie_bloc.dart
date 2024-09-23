import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_list/core/services/now-playing_service.dart';
import 'package:movie_app_list/models/movie_model.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<MovieEvent>((event, emit) async {
      if (event is GetNowPlaying) {
        try {
          emit(MovieLoading());
          final result = await NowPlayingService().getNowPlaying();
          emit(MovieLoaded(result));
        } catch (e) {
          emit(MovieFailed(e.toString()));
        }
      }
    });
  }
}
