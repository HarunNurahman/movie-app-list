import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/genre_model.dart';
import '../../services/api_service.dart';

part 'genre_event.dart';
part 'genre_state.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  GenreBloc() : super(GenreInitial()) {
    on<GenreEvent>((event, emit) async {
      if (event is GenreEventStarted) {
        emit(GenreLoading());
        try {
          List<GenreModel> genreList = await ApiService().getGenreList();
          emit(GenreSuccess(genreList));
        } catch (e) {
          emit(GenreError('Error: $e'));
        }
      }
    });
  }

  // @override
  // Stream<GenreState> mapEventToState(GenreEvent event) async* {
  //   if (event is GenreEventStarted) {
  //     yield* _mapGenreEventToState();
  //   }
  // }

  // Stream<GenreState> _mapGenreEventToState() async* {
  //   final service = ApiService();
  //   yield GenreLoading();
  //   try {
  //     List<GenreModel> genreList = await service.getGenreList();

  //     yield GenreSuccess(genreList);
  //   } on Exception catch (e) {
  //     yield GenreError(e.toString());
  //   }
  // }
}
