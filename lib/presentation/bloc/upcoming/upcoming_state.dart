part of 'upcoming_bloc.dart';

sealed class UpcomingState extends Equatable {
  const UpcomingState();

  @override
  List<Object> get props => [];
}

final class UpcomingInitial extends UpcomingState {}

final class UpcomingLoading extends UpcomingState {}

final class UpcomingLoaded extends UpcomingState {
  final List<MovieModel> movies;
  const UpcomingLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

final class UpcomingFailed extends UpcomingState {
  final String errorMessage;
  const UpcomingFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
