part of 'new_songs_bloc.dart';

abstract class NewSongsEvent extends Equatable {
  const NewSongsEvent();
}

class GetNewSongsEvent extends NewSongsEvent {
  const GetNewSongsEvent();

  @override
  List<Object?> get props => [];
}
