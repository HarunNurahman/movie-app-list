part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchEventStarted extends SearchEvent {
  final String query;
  const SearchEventStarted(this.query);

  @override
  List<Object?> get props => [];
}
