
import 'package:anime_app_flutter/common/data/error/failure.dart';
import 'package:anime_app_flutter/movie/domain/models/movie_detail_model.dart';
import 'package:anime_app_flutter/movie/domain/models/popular_movie_model.dart';
import 'package:anime_app_flutter/movie/domain/models/top_rated_movide_model.dart';
import 'package:anime_app_flutter/movie/domain/models/upcoming_movie_model.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRespository {
  Future<Either<Failure, TopRatedModel>> getTopRatedMovie(int page);
  Future<Either<Failure, PopularMovieModel>> getPopularMovie(int page);
  Future<Either<Failure, UpcomingMovieModel>> getUpcomingMovie(int page);
  Future<Either<Failure, MovieDetailModel>> getMovieDetails(int id);
}