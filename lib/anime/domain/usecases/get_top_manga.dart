import 'package:anime_app_flutter/common/data/error/failure.dart';
import 'package:anime_app_flutter/common/domain/usecase/base_use_case.dart';
import 'package:anime_app_flutter/anime/domain/repository/mangaRepository.dart';
import 'package:anime_app_flutter/anime/domain/models/TopMangaModel.dart';
import 'package:dartz/dartz.dart';

class GetTopMangaUsecase extends BaseUseCase<TopMangaModel, NoParameters> {
  final MangaRespository _baseMangaRespository;

  GetTopMangaUsecase(this._baseMangaRespository);

  @override
  Future<Either<Failure, TopMangaModel>> call(NoParameters p) async {
    return await _baseMangaRespository.getTopManga();
  }
}
