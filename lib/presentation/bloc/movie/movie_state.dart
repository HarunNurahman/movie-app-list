part of 'movie_bloc.dart';

sealed class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

final class MovieInitial extends MovieState {}

final class MovieLoading extends MovieState {}

final class MovieLoaded extends MovieState {
  final List<MovieModel> movies;
  const MovieLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

final class MovieFailed extends MovieState {
  final String errorMessage;
  const MovieFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
