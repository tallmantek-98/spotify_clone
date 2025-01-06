import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';

class SongModel {
  String? title;
  String? artist;
  num? duration;
  Timestamp? releaseDate;

  SongModel({
    required this.artist,
    required this.duration,
    required this.releaseDate,
    required this.title,
  });

  @immutable
  SongModel.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    artist = data['artist'];
    duration = data['duration'];
    artist = data['releaseDate'];
  }
}

extension SongModelx on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      artist: artist!,
      duration: duration!,
      releaseDate: releaseDate!,
      title: title!,
    );
  }
}
