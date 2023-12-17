

import 'package:anime_app_flutter/anime/domain/models/TopAiringAnimeModel.dart';
import 'package:anime_app_flutter/anime/domain/models/TopMangaModel.dart';
import 'package:anime_app_flutter/common/domain/utils/enums.dart';
import 'package:equatable/equatable.dart';

class AnimeState extends Equatable {
  final TopAiringAnimeModel? topAnimeAiringModel;
  final TopMangaModel? topMangaModel;
  final RequestStatus status;
  final String message;

  const AnimeState({
    this.topAnimeAiringModel,
    this.topMangaModel,
    this.status = RequestStatus.loading,
    this.message = '',
  });

  AnimeState copyWith({
    TopAiringAnimeModel? topAnimeAiringModel,
    TopMangaModel? topMangaModel,
    RequestStatus? status,
    String? message,
  }) {
    return AnimeState(
      topAnimeAiringModel: topAnimeAiringModel ?? topAnimeAiringModel,
      topMangaModel: topMangaModel ?? topMangaModel,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        topAnimeAiringModel,
        topMangaModel,
        status,
        message,
      ];
}