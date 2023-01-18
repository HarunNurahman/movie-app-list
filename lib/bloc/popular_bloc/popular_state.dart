part of 'popular_bloc.dart';

abstract class PopularState extends Equatable {
  const PopularState();

  @override
  List<Object> get props => [];
}

class PopularInitial extends PopularState {}

class PopularLoading extends PopularState {}

class PopularSuccess extends PopularState {
  final List<MovieModel> movieList;
  const PopularSuccess(this.movieList);

  @override
  List<Object> get props => [movieList];
}

class PopularError extends PopularState {
  final String errorMessage;
  const PopularError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
