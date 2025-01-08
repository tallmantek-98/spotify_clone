import 'package:dartz/dartz.dart';

abstract class ISongsRepository {
  Future<Either> getNewSongs();
}
