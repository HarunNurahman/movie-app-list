import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/movie_model.dart';
import '../../services/api_service.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  PopularBloc() : super(PopularInitial()) {
    on<PopularEvent>((event, emit) async {
      if (event is PopularEventStarted) {
        emit(PopularLoading());
        try {
          List<MovieModel> movieList;
          movieList = await ApiService().getPopularMovie();

          emit(PopularSuccess(movieList));
        } catch (e) {
          emit(PopularError(e.toString()));
        }
      }
    });
  }

  // @override
  // Stream<PopularState> mapEventToState(PopularEvent event) async* {
  //   if (event is PopularEventStarted) {
  //     yield* _mapPopularEventToState(event.movieId, event.query);
  //   }
  // }

  // Stream<PopularState> _mapPopularEventToState(
  //   int movieId,
  //   String query,
  // ) async* {
  //   final service = ApiService();
  //   yield PopularLoading();

  //   try {
  //     List<MovieModel> movieList;
  //     movieList = await service.getPopularMovie();

  //     yield PopularSuccess(movieList);
  //   } catch (e) {
  //     yield PopularError(e.toString());
  //   }
  // }
}
