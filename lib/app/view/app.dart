// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:now_playing/bloc/bloc.dart';
import 'package:now_playing/now_playing/now_playing.dart';
import 'package:now_playing/spotify/spotify_client.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => AlbumBloc(spotifyClient: SpotifyClient())
          ..add(const AlbumRequested()),
        child: const NowPlayingPage(),
      ),
    );
  }
}
