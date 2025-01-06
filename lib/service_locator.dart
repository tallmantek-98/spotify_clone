import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_clone/data/repository/song/i_song_repository.dart';
import 'package:spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/data/sources/song/song_firebase_service.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import 'package:spotify_clone/domain/repository/song/song_repository.dart';
import 'package:spotify_clone/domain/usecases/auth/signin.dart';
import 'package:spotify_clone/domain/usecases/auth/signup.dart';
import 'package:spotify_clone/domain/usecases/song/get_new_songs.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(
    IAuthFireBaseService(),
  );

  sl.registerSingleton<SongFirebaseService>(
    ISongFirebaseService(),
  );

  sl.registerSingleton<AuthRepository>(
    IAuthRepository(),
  );

  sl.registerSingleton<SongsRepository>(
    ISongRepository(),
  );

  sl.registerSingleton<SignupUseCase>(
    SignupUseCase(),
  );

  sl.registerSingleton<SigninUseCase>(
    SigninUseCase(),
  );

  sl.registerSingleton<GetNewSongsUseCase>(
    GetNewSongsUseCase(),
  );
}
