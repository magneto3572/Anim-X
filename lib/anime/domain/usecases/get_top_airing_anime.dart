import 'package:anime_app_flutter/common/data/error/failure.dart';
import 'package:anime_app_flutter/common/domain/usecase/base_use_case.dart';
import 'package:anime_app_flutter/anime/domain/repository/mangaRepository.dart';
import 'package:anime_app_flutter/anime/domain/models/TopAiringAnimeModel.dart';
import 'package:dartz/dartz.dart';

class GetTopAiringAnimeUsecase extends BaseUseCase<TopAiringAnimeModel, NoParameters> {
  final MangaRespository _baseMangaRespository;

  GetTopAiringAnimeUsecase(this._baseMangaRespository);

  @override
  Future<Either<Failure, TopAiringAnimeModel>> call(NoParameters p) async {
    return await _baseMangaRespository.getTopAiringAnime();
  }
}
