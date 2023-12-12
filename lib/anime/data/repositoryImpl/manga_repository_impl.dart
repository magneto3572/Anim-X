

import 'package:anime_app_flutter/common/data/error/exception_handler.dart';
import 'package:anime_app_flutter/common/data/error/failure.dart';
import 'package:anime_app_flutter/anime/data/datasource/manga_remote_data_source.dart';
import 'package:anime_app_flutter/anime/domain/repository/mangaRepository.dart';
import 'package:anime_app_flutter/anime/domain/models/TopAiringAnimeModel.dart';
import 'package:anime_app_flutter/anime/domain/models/TopMangaModel.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class MangaRepositoryImpl extends MangaRespository {
  final MangaRemoteDataSource _baseMangaRemoteDataSource;

  MangaRepositoryImpl(this._baseMangaRemoteDataSource);

  @override
  Future<Either<Failure, TopAiringAnimeModel>> getTopAiringAnime() async {
    try {
      final result = await _baseMangaRemoteDataSource.getTopAiringAnime();
      return Right(result);
    } on ExceptionHandlder catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message!));
    } on DioException catch (failure) {
      return Left(ServerFailure(failure.message.toString()));
    }
  }

  @override
  Future<Either<Failure, TopMangaModel>> getTopManga() async {
    try {
      final result = await _baseMangaRemoteDataSource.getTopManga();
      return Right(result);
    } on ExceptionHandlder catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message!));
    } on DioException catch (failure) {
      return Left(ServerFailure(failure.message.toString()));
    }
  }
}
