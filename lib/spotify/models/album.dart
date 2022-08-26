import 'package:equatable/equatable.dart';

class Album extends Equatable {
  const Album({
    required this.artist,
    required this.name,
    required this.imageUrl,
  });

  final String artist;
  final String name;
  final String imageUrl;

  @override
  List<Object?> get props => [artist, name, imageUrl];
}
