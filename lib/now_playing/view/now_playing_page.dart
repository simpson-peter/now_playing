// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:now_playing/now_playing/now_playing.dart';

class NowPlayingPage extends StatelessWidget {
  const NowPlayingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const NowPlayingView(),
    );
  }
}

class NowPlayingView extends StatelessWidget {
  const NowPlayingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F5),
      body: Center(
        child: Container(
          width: 450,
          height: 112,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const AlbumArt(),
              const SizedBox(width: 8),
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

  static const textStyle = TextStyle(
    fontFamily: 'Silkscreen',
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Now Playing...',
          style: textStyle,
        ),
        Text(
          'My Bloody Valentine - Loveless',
          style: textStyle.copyWith(
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
