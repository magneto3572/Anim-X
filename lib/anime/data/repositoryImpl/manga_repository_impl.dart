

import 'package:anime_app_flutter/common/data/error/exception_handler.dart';
import 'package:anime_app_flutter/common/data/error/failure.dart';
import 'package:anime_app_flutter/anime/data/datasource/manga_remote_data_source.dart';
import 'package:anime_app_flutter/anime/domain/repository/mangaRepository.dart';
import 'package:anime_app_flutter/anime/domain/models/manga_airing_model.dart';
import 'package:anime_app_flutter/anime/domain/models/manga_featured_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class MangaRepositoryImpl extends MangaRespository {
  final MangaRemoteDataSource _baseMangaRemoteDataSource;

  MangaRepositoryImpl(this._baseMangaRemoteDataSource);

  @override
  Future<Either<Failure, MangaAiringModel>> getAiringManga() async {
    try {
      final result = await _baseMangaRemoteDataSource.getTrendingManga();
      return Right(result);
    } on ExceptionHandlder catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message!));
    } on DioError catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, FeaturedMangaModel>> getFeaturedManga() async {
    try {
      final result = await _baseMangaRemoteDataSource.getFeaturedManga();
      return Right(result);
    } on ExceptionHandlder catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message!));
    } on DioError catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }
}
