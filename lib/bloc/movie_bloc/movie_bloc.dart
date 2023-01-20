import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp_javan_devtest/models/movie_model.dart';
import 'package:movieapp_javan_devtest/services/api_service.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial());
  // {
  //   on<MovieEvent>((event, emit) async {
  //     if (event is MovieEventStarted) {
  //       emit(MovieLoading());
  //       try {
  //         List<MovieModel> movieList;
  //         movieList = await ApiService().getNowPlayingMovie();

  //         emit(MovieSuccess(movieList));
  //       } catch (e) {
  //         emit(MovieError(e.toString()));
  //       }
  //     }
  //   });
  // }

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
