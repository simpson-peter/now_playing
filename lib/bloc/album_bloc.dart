import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:now_playing/spotify/spotify.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc({required SpotifyClient spotifyClient})
      : _spotifyClient = spotifyClient,
        super(const AlbumState.initial()) {
    on<AlbumRequested>(_onAlbumRequested);
  }

  final SpotifyClient _spotifyClient;

  Future<void> _onAlbumRequested(
    AlbumRequested event,
    Emitter<AlbumState> emit,
  ) async {
    if (state.album == null) {
      emit(state.copyWith(status: AlbumStatus.loading));
    }

    try {
      final album = await _spotifyClient.getAlbum();
      emit(state.copyWith(status: AlbumStatus.populated, album: album));
    } catch (e) {
      emit(state.copyWith(status: AlbumStatus.failure));
    }
  }
}
