import 'package:anime_app_flutter/common/data/error/failure.dart';
import 'package:anime_app_flutter/common/domain/usecase/base_use_case.dart';
import 'package:anime_app_flutter/anime/domain/repository/mangaRepository.dart';
import 'package:anime_app_flutter/anime/domain/models/manga_airing_model.dart';
import 'package:dartz/dartz.dart';

class GetTrendingMangaUseCase extends BaseUseCase<MangaAiringModel, NoParameters> {
  final MangaRespository _baseMangaRespository;

  GetTrendingMangaUseCase(this._baseMangaRespository);

  @override
  Future<Either<Failure, MangaAiringModel>> call(NoParameters p) async {
    return await _baseMangaRespository.getAiringManga();
  }
}
