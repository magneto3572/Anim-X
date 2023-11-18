import 'package:anime_app_flutter/common/data/error/failure.dart';
import 'package:anime_app_flutter/common/domain/usecase/base_use_case.dart';
import 'package:anime_app_flutter/movie/domain/models/top_rated_movide_model.dart';
import 'package:anime_app_flutter/movie/domain/repository/MovieRepository.dart';
import 'package:dartz/dartz.dart';

class GetTopRatedUseCase extends BaseUseCase<TopRatedModel, int> {
  final MovieRespository _movieRespository;

  GetTopRatedUseCase(this._movieRespository);

  @override
  Future<Either<Failure, TopRatedModel>> call(int p) async {
    return await _movieRespository.getTopRatedMovie(p);
  }
}
