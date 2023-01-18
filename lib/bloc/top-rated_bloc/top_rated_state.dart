part of 'top_rated_bloc.dart';

abstract class TopRatedState extends Equatable {
  const TopRatedState();

  @override
  List<Object> get props => [];
}

class TopRatedInitial extends TopRatedState {}

class TopRatedLoading extends TopRatedState {}

class TopRatedSuccess extends TopRatedState {
  final List<MovieModel> movieList;
  const TopRatedSuccess(this.movieList);

  @override
  List<Object> get props => [movieList];
}

class TopRatedError extends TopRatedState {
  final String errorMessage;
  const TopRatedError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
