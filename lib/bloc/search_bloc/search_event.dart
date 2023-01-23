part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchsEventStarted extends SearchEvent {
  final String query;
  const SearchsEventStarted(this.query);

  @override
  List<Object?> get props => [];
}
