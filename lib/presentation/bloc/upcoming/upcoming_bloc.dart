import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_list/core/services/upcoming_service.dart';
import 'package:movie_app_list/models/movie_model.dart';

part 'upcoming_event.dart';
part 'upcoming_state.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  UpcomingBloc() : super(UpcomingInitial()) {
    on<UpcomingEvent>((event, emit) async {
      if (event is GetUpcoming) {
        try {
          emit(UpcomingLoading());
          final result = await UpComingService().getUpcoming();
          emit(UpcomingLoaded(result));
        } catch (e) {
          emit(UpcomingFailed(e.toString()));
        }
      }
    });
  }
}
