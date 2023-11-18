import 'package:anime_app_flutter/common/data/error/failure.dart';
import 'package:anime_app_flutter/common/domain/usecase/base_use_case.dart';
import 'package:anime_app_flutter/movie/domain/models/popular_movie_model.dart';
import 'package:anime_app_flutter/movie/domain/repository/MovieRepository.dart';
import 'package:dartz/dartz.dart';

class GetPopularMovieUseCase extends BaseUseCase<PopularMovieModel, int> {
  final MovieRespository _movieRespository;

  GetPopularMovieUseCase(this._movieRespository);

  @override
  Future<Either<Failure, PopularMovieModel>> call(int p) async {
    return await _movieRespository.getPopularMovie(p);
  }
}
