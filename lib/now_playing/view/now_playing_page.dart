// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:now_playing/now_playing/now_playing.dart';
import 'package:now_playing/l10n/l10n.dart';

class NowPlayingPage extends StatelessWidget {
  const NowPlayingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F5),
      body: Center(
        child: Container(
          width: 400,
          height: 108,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(width: 4),
          ),
          child: Row(
            children: [
              const AlbumArt(),
              const SizedBox(width: 4),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(height: 1),
                  PlayingName(),
                  SizedBox(height: 1),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AlbumArt extends StatelessWidget {
  const AlbumArt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://upload.wikimedia.org/wikipedia/en/4/4b/My_Bloody_Valentine_-_Loveless.png',
      width: 100,
      height: 100,
    );
  }
}

class PlayingName extends StatelessWidget {
  const PlayingName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Now Playing...'),
        Text('My Bloody Valentine - Loveless'),
      ],
    );
  }
}
