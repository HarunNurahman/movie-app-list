part of 'top_rated_bloc.dart';

abstract class TopRatedEvent extends Equatable {
  const TopRatedEvent();

  @override
  List<Object> get props => [];
}

class TopRatedEventStarted extends TopRatedEvent {
  final int movieId;
  final String query;

  const TopRatedEventStarted(this.movieId, this.query);

  @override
  List<Object> get props => [];
}
