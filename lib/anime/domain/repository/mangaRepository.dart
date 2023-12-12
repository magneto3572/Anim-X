
import 'package:anime_app_flutter/anime/domain/models/TopMangaModel.dart';
import 'package:anime_app_flutter/common/data/error/failure.dart';
import 'package:anime_app_flutter/anime/domain/models/TopAiringAnimeModel.dart';
import 'package:dartz/dartz.dart';

abstract class MangaRespository {
  Future<Either<Failure, TopAiringAnimeModel>> getTopAiringAnime();
  Future<Either<Failure, TopMangaModel>> getTopManga();
}