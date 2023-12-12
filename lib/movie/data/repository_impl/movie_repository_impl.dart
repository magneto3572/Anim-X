

import 'package:anime_app_flutter/common/data/error/exception_handler.dart';
import 'package:anime_app_flutter/common/data/error/failure.dart';
import 'package:anime_app_flutter/movie/data/datasource/movie_remote_data_source.dart';
import 'package:anime_app_flutter/movie/domain/models/movie_detail_model.dart';
import 'package:anime_app_flutter/movie/domain/models/popular_movie_model.dart';
import 'package:anime_app_flutter/movie/domain/models/top_rated_movide_model.dart';
import 'package:anime_app_flutter/movie/domain/models/upcoming_movie_model.dart';
import 'package:anime_app_flutter/movie/domain/repository/MovieRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class MovieRepositoryImpl extends MovieRespository {
  final MovieRemoteDataSource _movieRemoteDataSource;

  MovieRepositoryImpl(this._movieRemoteDataSource);
  
  @override
  Future<Either<Failure, PopularMovieModel>> getPopularMovie(int page) async {
    try {
      final result = await _movieRemoteDataSource.getPopularMovie(page);
      return Right(result);
    } on ExceptionHandlder catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message!));
    } on DioException catch (failure) {
      return Left(ServerFailure(failure.message.toString()));
    }
  }
  
  @override
  Future<Either<Failure, TopRatedModel>> getTopRatedMovie(int page) async {
   try {
      final result = await _movieRemoteDataSource.getTopRatedMovie(page);
      return Right(result);
    } on ExceptionHandlder catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message!));
    } on DioException catch (failure) {
      return Left(ServerFailure(failure.message.toString()));
    }
  }
  
  @override
  Future<Either<Failure, UpcomingMovieModel>> getUpcomingMovie(int page) async {
    try {
      final result = await _movieRemoteDataSource.getUpcomingMovie(page);
      return Right(result);
    } on ExceptionHandlder catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message!));
    } on DioException catch (failure) {
      return Left(ServerFailure(failure.message.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieDetailModel>> getMovieDetails(int id) async {
    try {
      final result = await _movieRemoteDataSource.getMovideDetails(id);
      return Right(result);
    } on ExceptionHandlder catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message!));
    } on DioException catch (failure) {
      return Left(ServerFailure(failure.message.toString()));
    }
  }
}
