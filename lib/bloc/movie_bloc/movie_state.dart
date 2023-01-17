part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieSuccess extends MovieState {
  final List<MovieModel> movieList;
  const MovieSuccess(this.movieList);

  @override
  List<Object> get props => [movieList];
}

class MovieError extends MovieState {
  final String errorMessage;
  const MovieError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
