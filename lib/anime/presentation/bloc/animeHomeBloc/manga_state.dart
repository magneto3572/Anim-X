


import 'package:anime_app_flutter/anime/domain/models/manga_airing_model.dart';
import 'package:anime_app_flutter/anime/domain/models/manga_featured_model.dart';
import 'package:anime_app_flutter/common/domain/utils/enums.dart';
import 'package:equatable/equatable.dart';

class MangaState extends Equatable {
  final MangaAiringModel? mangaAiringModel;
  final FeaturedMangaModel? featuredMangaModel;
  final RequestStatus status;
  final String message;

  const MangaState({
    this.mangaAiringModel,
    this.featuredMangaModel,
    this.status = RequestStatus.loading,
    this.message = '',
  });

  MangaState copyWith({
    MangaAiringModel? mangaAiringModel,
    FeaturedMangaModel? featuredMangaModel,
    RequestStatus? status,
    String? message,
  }) {
    return MangaState(
      mangaAiringModel: mangaAiringModel ?? this.mangaAiringModel,
      featuredMangaModel: featuredMangaModel ?? this.featuredMangaModel,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        mangaAiringModel,
        featuredMangaModel,
        status,
        message,
      ];
}