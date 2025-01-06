import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/presentation/root/bloc/new_songs_cubit.dart';
import 'package:spotify_clone/presentation/root/bloc/new_songs_state.dart';

class NewSongs extends StatelessWidget {
  const NewSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewSongsCubit()..getNewSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewSongsCubit, NewSongsState>(
            builder: (context, state) {
          if (state is NewSongsLoading) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }

          if (state is NewSongsLoaded) {
            return _songs(state.songs);
          }

          return Container();
        }),
      ),
    );
  }
}

Widget _songs(List<SongEntity> songs) {
  return ListView.separated(
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, i) {
      return const Column(
        children: [],
      );
    },
    separatorBuilder: (context, i) => const SizedBox(
      width: 14,
    ),
    itemCount: songs.length,
  );
}
