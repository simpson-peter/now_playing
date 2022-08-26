import 'package:http/http.dart' as http;
import 'package:now_playing/spotify/spotify_client.dart';

void main() async {
  final _client = http.Client();
  final spotify = SpotifyClient();
  final album = await spotify.getAlbum();
  print(album.name);
}
