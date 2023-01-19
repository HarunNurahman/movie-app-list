part of 'upcoming_bloc.dart';

abstract class UpcomingState extends Equatable {
  const UpcomingState();

  @override
  List<Object> get props => [];
}

class UpcomingInitial extends UpcomingState {}

class UpcomingLoading extends UpcomingState {}

class UpcomingSuccess extends UpcomingState {
  final List<MovieModel> movieList;
  const UpcomingSuccess(this.movieList);

  @override
  List<Object> get props => [movieList];
}

class UpcomingError extends UpcomingState {
  final String errorMessage;
  const UpcomingError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
