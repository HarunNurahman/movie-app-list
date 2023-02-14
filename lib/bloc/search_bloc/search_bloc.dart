import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/movie_model.dart';
import '../../services/api_service.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchEvent>((event, emit) async {
      if (event is SearchEventStarted) {
        emit(SearchLoading());
        try {
          List<MovieModel> searchResult;
          searchResult = await ApiService().getSearchResult(event.query);

          emit(SearchSuccess(searchResult));
        } catch (e) {
          emit(SearchError(e.toString()));
        }
      }
    });
  }
}
