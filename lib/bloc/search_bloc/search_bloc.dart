import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp_javan_devtest/models/movie_model.dart';
import 'package:movieapp_javan_devtest/services/api_service.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial());

  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchsEventStarted) {
      yield* _mapSearchEventToState(event.query);
    }
  }

  Stream<SearchState> _mapSearchEventToState(String query) async* {
    final service = ApiService();
    yield SearchLoading();

    try {
      List<MovieModel> searchResult;
      searchResult = await service.getSearchResult(query);

      yield SearchSuccess(searchResult);
    } catch (e) {
      yield SearchError(e.toString());
    }
  }
}
