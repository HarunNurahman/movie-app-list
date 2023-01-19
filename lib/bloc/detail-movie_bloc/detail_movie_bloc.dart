import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp_javan_devtest/models/detail-movie_model.dart';
import 'package:movieapp_javan_devtest/services/api_service.dart';

part 'detail_movie_event.dart';
part 'detail_movie_state.dart';

class DetailMovieBloc extends Bloc<DetailMovieEvent, DetailMovieState> {
  DetailMovieBloc() : super(DetailMovieInitial());

  @override
  Stream<DetailMovieState> mapEventToState(DetailMovieEvent event) async* {
    if (event is DetailMovieEventStarted) {
      yield* _mapDetailMovieEventStarted(event.id);
    }
  }

  Stream<DetailMovieState> _mapDetailMovieEventStarted(int id) async* {
    final service = ApiService();
    yield DetailMovieLoading();

    try {
      final detailMovie = await service.getMovieDetail(id);
      yield DetailMovieSuccess(detailMovie);
    } catch (e) {
      yield DetailMovieError(e.toString());
    }
  }
}
