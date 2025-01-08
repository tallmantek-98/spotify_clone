import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/presentation/root/bloc/new_songs_bloc.dart';
import '../../../core/config/constants/app_urls.dart';
import '../../../core/config/theme/app_colors.dart';

class NewSongs extends StatelessWidget {
  const NewSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewSongsBloc>(
      create: (_) => NewSongsBloc()..getNewSongs(Emitter<NewSongState>),
      child: SizedBox(
        height: 200,
        child:
            BlocBuilder<NewSongsBloc, NewSongState>(builder: (context, state) {
          if (state.loading == true) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          }

          if (state.loading == true && state.songs.isNotEmpty) {
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
      return SizedBox(
        width: 160,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      '${AppUrls.fireStorage}${songs[i].artist} - ${songs[i].title}.jpg?${AppUrls.mediaAlt}',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
    separatorBuilder: (context, i) => const SizedBox(
      width: 14,
    ),
    itemCount: songs.length,
  );
}
