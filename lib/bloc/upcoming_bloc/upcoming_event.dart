part of 'upcoming_bloc.dart';

abstract class UpcomingEvent extends Equatable {
  const UpcomingEvent();

  @override
  List<Object> get props => [];
}

class UpcomingEventStarted extends UpcomingEvent {
  final int movieId;
  final String query;

  const UpcomingEventStarted(this.movieId, this.query);

  @override
  List<Object> get props => [];
}
