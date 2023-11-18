import 'package:anime_app_flutter/common/data/error/failure.dart';
import 'package:anime_app_flutter/common/domain/usecase/base_use_case.dart';
import 'package:anime_app_flutter/anime/domain/repository/mangaRepository.dart';
import 'package:anime_app_flutter/anime/domain/models/manga_featured_model.dart';
import 'package:dartz/dartz.dart';

class GetFeaturedMangaUseCase extends BaseUseCase<FeaturedMangaModel, NoParameters> {
  final MangaRespository _baseMangaRespository;

  GetFeaturedMangaUseCase(this._baseMangaRespository);

  @override
  Future<Either<Failure, FeaturedMangaModel>> call(NoParameters p) async {
    return await _baseMangaRespository.getFeaturedManga();
  }
}
