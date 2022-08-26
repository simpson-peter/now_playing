part of 'album_bloc.dart';

enum AlbumStatus {
  initial,
  loading,
  populated,
  failure,
}

class AlbumState extends Equatable {
  const AlbumState({required this.status, this.album});

  const AlbumState.initial() : this(status: AlbumStatus.initial);

  AlbumState copyWith({AlbumStatus? status, Album? album}) {
    return AlbumState(
      status: status ?? this.status,
      album: album ?? this.album,
    );
  }

  final AlbumStatus status;
  final Album? album;

  @override
  List<Object?> get props => [status, album];
}
