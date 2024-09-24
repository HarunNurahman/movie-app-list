part of 'top_rated_bloc.dart';

sealed class TopRatedState extends Equatable {
  const TopRatedState();

  @override
  List<Object> get props => [];
}

final class TopRatedInitial extends TopRatedState {}

final class TopRatedLoading extends TopRatedState {}

final class TopRatedLoaded extends TopRatedState {
  final List<MovieModel> movies;
  const TopRatedLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

final class TopRatedFailed extends TopRatedState {
  final String errorMessage;
  const TopRatedFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
