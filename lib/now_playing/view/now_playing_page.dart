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
import 'package:now_playing/spotify/spotify.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

const textStyle = TextStyle(
  fontFamily: 'Silkscreen',
  fontSize: 14,
  fontWeight: FontWeight.w500,
);

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
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state.status == AlbumStatus.populated) {
            return GestureDetector(
              child: AlbumPopulated(album: state.album!),
              onTap: () {
                context.read<AlbumBloc>().add(const AlbumRequested());
              },
            );
          } else if (state.status == AlbumStatus.failure) {
            return const Visibility(visible: false, child: SizedBox(width: 0));
          } else {
            return const AlbumLoading();
          }
        },
      ),
    );
  }
}

class AlbumPopulated extends StatelessWidget {
  const AlbumPopulated({
    required this.album,
    Key? key,
  }) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 450,
        height: 112,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(width: 2),
        ),
        child: Row(
          children: [
            AlbumArt(
              imageUrl: album.imageUrl,
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Now Playing...',
                  style: textStyle.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                PlayingName(
                  artistName: album.artist,
                  albumName: album.name,
                ),
                const SizedBox(height: 1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AlbumLoading extends StatelessWidget {
  const AlbumLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 450,
        height: 112,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(width: 2),
        ),
        child: Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: Colors.grey,
            size: 40,
          ),
        ),
      ),
    );
  }
}

class AlbumArt extends StatelessWidget {
  const AlbumArt({required this.imageUrl, Key? key}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: 100,
      height: 100,
    );
  }
}

class PlayingName extends StatelessWidget {
  const PlayingName({
    required this.albumName,
    required this.artistName,
    Key? key,
  }) : super(key: key);

  final String albumName;
  final String artistName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 328,
          child: Text(
            artistName,
            style: textStyle,
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
          ),
        ),
        SizedBox(
          width: 328,
          child: Text(
            albumName,
            style: textStyle.copyWith(
              fontStyle: FontStyle.italic,
            ),
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
          ),
        ),
      ],
    );
  }
}
