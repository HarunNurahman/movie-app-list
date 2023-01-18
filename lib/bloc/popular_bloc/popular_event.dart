part of 'popular_bloc.dart';

abstract class PopularEvent extends Equatable {
  const PopularEvent();

  @override
  List<Object> get props => [];
}

class PopularEventStarted extends PopularEvent {
  final int movieId;
  final String query;
  const PopularEventStarted(this.movieId, this.query);

  @override
  List<Object> get props => [];
}
