


import 'package:anime_app_flutter/common/domain/utils/enums.dart';
import 'package:anime_app_flutter/manga/domain/models/manga_airing_model.dart';
import 'package:equatable/equatable.dart';

class MangaState extends Equatable {
  final MangaAiringModel? mangaAiringModel;
  final RequestStatus status;
  final String message;

  const MangaState({
    this.mangaAiringModel,
    this.status = RequestStatus.loading,
    this.message = '',
  });

  MangaState copyWith({
    MangaAiringModel? mangaAiringModel,
    RequestStatus? status,
    String? message,
  }) {
    return MangaState(
      mangaAiringModel: mangaAiringModel ?? this.mangaAiringModel,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        mangaAiringModel,
        status,
        message,
      ];
}