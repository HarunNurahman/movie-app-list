import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_list/core/services/top-rated_service.dart';
import 'package:movie_app_list/models/movie_model.dart';

part 'top_rated_event.dart';
part 'top_rated_state.dart';

class TopRatedBloc extends Bloc<TopRatedEvent, TopRatedState> {
  TopRatedBloc() : super(TopRatedInitial()) {
    on<TopRatedEvent>((event, emit) async {
      if (event is GetTopRated) {
        try {
          emit(TopRatedLoading());
          final result = await TopRatedService().getTopRated();
          emit(TopRatedLoaded(result));
        } catch (e) {
          emit(TopRatedFailed(e.toString()));
        }
      }
    });
  }
}
