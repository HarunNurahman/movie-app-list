part of 'now_playing_bloc.dart';

sealed class NowPlayingState extends Equatable {
  const NowPlayingState();

  @override
  List<Object> get props => [];
}

final class NowPlayingInitial extends NowPlayingState {}

final class NowPlayingLoading extends NowPlayingState {}

final class NowPlayingLoaded extends NowPlayingState {
  final List<MovieModel> movies;
  const NowPlayingLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

final class NowPlayingFailed extends NowPlayingState {
  final String errorMessage;
  const NowPlayingFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
