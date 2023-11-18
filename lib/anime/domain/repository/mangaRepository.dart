
import 'package:anime_app_flutter/anime/domain/models/manga_featured_model.dart';
import 'package:anime_app_flutter/common/data/error/failure.dart';
import 'package:anime_app_flutter/anime/domain/models/manga_airing_model.dart';
import 'package:dartz/dartz.dart';

abstract class MangaRespository {
  Future<Either<Failure, MangaAiringModel>> getAiringManga();
  Future<Either<Failure, FeaturedMangaModel>> getFeaturedManga();
}