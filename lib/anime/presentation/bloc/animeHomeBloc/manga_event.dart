import 'package:equatable/equatable.dart';

abstract class MangaEvent extends Equatable {
  const MangaEvent();
  @override
  List<Object?> get props => [];
}

class GetMangaEvent extends MangaEvent {}

