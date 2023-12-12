import 'package:equatable/equatable.dart';

abstract class AnimeEvent extends Equatable {
  const AnimeEvent();
}

class GetAnimeEvent extends AnimeEvent {
  const GetAnimeEvent();
  @override
  List<Object?> get props => [];
}

