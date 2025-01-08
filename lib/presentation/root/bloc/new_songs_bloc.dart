import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/usecases/song/get_new_songs.dart';
import '../../../domain/entities/song/song.dart';
import '../../../service_locator.dart';

part 'new_songs_event.dart';
part 'new_songs_state.dart';

class NewSongsBloc extends Bloc<NewSongsEvent, NewSongState> {
  NewSongsBloc() : super(const NewSongState());

  Future<void> getNewSongs(emit) async {
    var fetchedSongs = await sl<GetNewSongsUseCase>().call();

    fetchedSongs.fold(
      (error) => emit(state.copyWith(
        error: error,
        loading: false,
      )),
      (data) => emit(state.copyWith(
        error: '',
        loading: false,
        songs: data,
      )),
    );
  }
}
