import 'package:anime_app_flutter/common/data/error/failure.dart';
import 'package:anime_app_flutter/common/domain/usecase/base_use_case.dart';
import 'package:anime_app_flutter/movie/domain/models/movie_detail_model.dart';
import 'package:anime_app_flutter/movie/domain/repository/MovieRepository.dart';
import 'package:dartz/dartz.dart';

class GetMovieDetailUsecase extends BaseUseCase<MovieDetailModel, int> {
  final MovieRespository _movieRespository;

  GetMovieDetailUsecase(this._movieRespository);

  @override
  Future<Either<Failure, MovieDetailModel>> call(int p) async {
    return await _movieRespository.getMovieDetails(p);
  }
}
