import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp_javan_devtest/models/movie_model.dart';
import 'package:movieapp_javan_devtest/services/api_service.dart';

part 'upcoming_event.dart';
part 'upcoming_state.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  UpcomingBloc() : super(UpcomingInitial());

  @override
  Stream<UpcomingState> mapEventToState(UpcomingEvent event) async* {
    if (event is UpcomingEventStarted) {
      yield* _mapUpcomingEventToState(event.movieId, event.query);
    }
  }

  Stream<UpcomingState> _mapUpcomingEventToState(
    int movieId,
    String query,
  ) async* {
    final service = ApiService();
    yield UpcomingLoading();

    try {
      List<MovieModel> movieList;
      movieList = await service.getUpcomingMovie();

      yield UpcomingSuccess(movieList);
    } catch (e) {
      yield UpcomingError(e.toString());
    }
  }
}
