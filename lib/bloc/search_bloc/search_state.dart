part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<MovieModel> searchResult;
  const SearchSuccess(this.searchResult);

  @override
  List<Object> get props => [searchResult];
}

class SearchError extends SearchState {
  final String errorMessage;
  const SearchError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
