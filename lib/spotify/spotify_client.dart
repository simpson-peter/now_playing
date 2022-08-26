import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:spotify/spotify.dart';

class SpotifyClient {
  SpotifyClient(this._client);

  static const _spotifyClientId = '63741f6f8175466583a12871a13a2798';

  // TODO(simpson): DO NOT COMMIT WITH THIS
  static const _spotifyClientSecret = '';

  static const _spotifyBaseUrl = 'accounts.spotify.com';

  String? _authToken;

  final http.Client _client;

  Future<void> getAlbum() async {
    final random = Random(DateTime.now().millisecondsSinceEpoch);
    final credentials =
        SpotifyApiCredentials(_spotifyClientId, _spotifyClientSecret);
    final spotify = SpotifyApi(credentials);
    final playlist = await spotify.playlists.get('2jMYlIoBBmUiM7YK59WJnL');
    final tracks = playlist.tracks!.itemsNative;
    final dynamic randomTrackJson =
        tracks!.elementAt(random.nextInt(tracks.length));
    final dynamic artist = randomTrackJson['track']['artists'][0]['name'];
    final dynamic albumName = randomTrackJson['track']['album']['name'];
    final dynamic albumImage =
        randomTrackJson['track']['album']['images'][0]['url'];
    print(artist);
    print(albumName);
    print(albumImage);
  }
}
