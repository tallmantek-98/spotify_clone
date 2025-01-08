import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/config/usecases/usecase.dart';

import '../../../data/repository/song/song_repository.dart';
import '../../../service_locator.dart';

class GetNewSongsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongsRepository>().getNewSongs();
  }
}
