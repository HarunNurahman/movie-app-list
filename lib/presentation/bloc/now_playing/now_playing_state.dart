part of 'now_playing_bloc.dart';

sealed class NowPlayingState extends Equatable {
  const NowPlayingState();
  
  @override
  List<Object> get props => [];
}

final class NowPlayingInitial extends NowPlayingState {}
