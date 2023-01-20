part of 'genre_bloc.dart';

abstract class GenreState extends Equatable {
  const GenreState();

  @override
  List<Object> get props => [];
}

class GenreInitial extends GenreState {}

class GenreLoading extends GenreState {}

class GenreSuccess extends GenreState {
  final List<GenreModel> genreList;
  const GenreSuccess(this.genreList);

  @override
  List<Object> get props => [genreList];
}

class GenreError extends GenreState {
  final String errorMessage;
  const GenreError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
