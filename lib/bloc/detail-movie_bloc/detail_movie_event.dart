part of 'detail_movie_bloc.dart';

abstract class DetailMovieEvent extends Equatable {
  const DetailMovieEvent();

  @override
  List<Object> get props => [];
}

class DetailMovieEventStarted extends DetailMovieEvent {
  final int id;

  const DetailMovieEventStarted(this.id);

  @override
  List<Object> get props => [];
}
