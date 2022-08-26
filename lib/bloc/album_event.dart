part of 'album_bloc.dart';

abstract class AlbumEvent extends Equatable {
  const AlbumEvent();

  @override
  List<Object> get props => [];
}

class AlbumRequested extends AlbumEvent {
  const AlbumRequested();

  @override
  List<Object> get props => [];
}
