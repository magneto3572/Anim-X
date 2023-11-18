import 'package:anime_app_flutter/common/data/error/failure.dart';
import 'package:anime_app_flutter/common/domain/usecase/base_use_case.dart';
import 'package:anime_app_flutter/movie/domain/models/upcoming_movie_model.dart';
import 'package:anime_app_flutter/movie/domain/repository/MovieRepository.dart';
import 'package:dartz/dartz.dart';

class GetUpcomingMovieUseCase extends BaseUseCase<UpcomingMovieModel, int> {
  final MovieRespository _movieRespository;

  GetUpcomingMovieUseCase(this._movieRespository);

  @override
  Future<Either<Failure, UpcomingMovieModel>> call(int p) async {
    return await _movieRespository.getUpcomingMovie(p);
  }
}
