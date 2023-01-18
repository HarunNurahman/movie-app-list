import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp_javan_devtest/models/movie_model.dart';
import 'package:movieapp_javan_devtest/services/api_service.dart';

part 'top_rated_event.dart';
part 'top_rated_state.dart';

class TopRatedBloc extends Bloc<TopRatedEvent, TopRatedState> {
  TopRatedBloc() : super(TopRatedInitial());

  @override
  Stream<TopRatedState> mapEventToState(TopRatedEvent event) async* {
    if (event is TopRatedEventStarted) {
      yield* _mapTopRatedEventToState(event.movieId, event.query);
    }
  }

  Stream<TopRatedState> _mapTopRatedEventToState(
    int movieId,
    String query,
  ) async* {
    final service = ApiService();
    yield TopRatedLoading();

    try {
      List<MovieModel> movieList;
      movieList = await service.getTopRatedMovie();

      yield TopRatedSuccess(movieList);
    } catch (e) {
      yield TopRatedError(e.toString());
    }
  }
}
