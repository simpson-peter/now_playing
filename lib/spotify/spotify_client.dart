// ignore_for_file: avoid_dynamic_calls
import 'dart:math';

import 'package:now_playing/spotify/spotify.dart';
import 'package:spotify/spotify.dart' as spotify_pkg;

class SpotifyClient {
  SpotifyClient();

  static const _spotifyClientId = '63741f6f8175466583a12871a13a2798';

  // TODO(simpson): DO NOT COMMIT WITH THIS
  static const _spotifyClientSecret = '';

  static const _playlistId = '5twmW6lYwfBbOLvT81xtom';

  final random = Random(DateTime.now().millisecondsSinceEpoch);

  Future<Album> getAlbum() async {
    final credentials = spotify_pkg.SpotifyApiCredentials(
      _spotifyClientId,
      _spotifyClientSecret,
    );
    final spotify = spotify_pkg.SpotifyApi(credentials);

    final playlist = await spotify.playlists.get(_playlistId);
    final tracks = playlist.tracks!.itemsNative;
    final dynamic randomTrackJson =
        tracks!.elementAt(random.nextInt(tracks.length));

    final artist = randomTrackJson['track']['artists'][0]['name'] as String;
    final albumName = randomTrackJson['track']['album']['name'] as String;
    final albumImage =
        randomTrackJson['track']['album']['images'][0]['url'] as String;

    final album = Album(artist: artist, name: albumName, imageUrl: albumImage);

    return album;
  }
}
