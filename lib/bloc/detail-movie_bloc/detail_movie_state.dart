part of 'detail_movie_bloc.dart';

abstract class DetailMovieState extends Equatable {
  const DetailMovieState();

  @override
  List<Object> get props => [];
}

class DetailMovieInitial extends DetailMovieState {}

class DetailMovieLoading extends DetailMovieState {}

class DetailMovieSuccess extends DetailMovieState {
  final DetailMovieModel detailMovie;
  const DetailMovieSuccess(this.detailMovie);

  @override
  List<Object> get props => [detailMovie];
}

class DetailMovieError extends DetailMovieState {
  final String errorMessage;
  const DetailMovieError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
