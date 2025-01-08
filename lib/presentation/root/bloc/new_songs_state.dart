part of 'new_songs_bloc.dart';

class NewSongState extends Equatable {
  const NewSongState({
    this.error = '',
    this.loading = false,
    this.songs = const [],
  });

  final String error;
  final bool loading;
  final List<SongEntity> songs;

  NewSongState copyWith({
    String? error,
    bool? loading,
    List<SongEntity>? songs,
  }) {
    return NewSongState(
      error: error ?? this.error,
      loading: loading ?? this.loading,
      songs: songs ?? this.songs,
    );
  }

  @override
  List<Object?> get props => [
        error,
        loading,
        songs,
      ];
}
