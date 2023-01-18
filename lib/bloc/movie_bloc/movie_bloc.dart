import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp_javan_devtest/models/movie_model.dart';
import 'package:movieapp_javan_devtest/services/api_service.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial());

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is MovieEventStarted) {
      yield* _mapMovieEventToState(event.movieId, event.query);
    }
  }

  Stream<MovieState> _mapMovieEventToState(int movieId, String query) async* {
    final service = ApiService();
    yield MovieLoading();

    try {
      List<MovieModel> movieList;
      movieList = await service.getNowPlayingMovie();

      yield MovieSuccess(movieList);
    } catch (e) {
      yield MovieError(e.toString());
    }
  }
}
