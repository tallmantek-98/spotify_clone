import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/sources/song/song_firebase_service.dart';
import 'package:spotify_clone/domain/repository/song/song_repository.dart';

import '../../../service_locator.dart';

class ISongRepository implements SongsRepository {
  @override
  Future<Either> getNewSongs() async {
    return await sl<SongFirebaseService>().getNewSongs();
  }
}
