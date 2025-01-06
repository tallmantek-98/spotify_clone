import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/usecases/song/get_new_songs.dart';
import 'package:spotify_clone/presentation/root/bloc/new_songs_state.dart';

import '../../../service_locator.dart';

class NewSongsCubit extends Cubit<NewSongsState> {
  NewSongsCubit() : super(NewSongsLoading());

  Future<void> getNewSongs() async {
    var fetchedSongs = await sl<GetNewSongsUseCase>().call();

    fetchedSongs.fold(
      (l) => emit(NewSongsLoadFailure()),
      (data) => emit(
        NewSongsLoaded(
          songs: data,
        ),
      ),
    );
  }
}
