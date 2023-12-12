import 'package:anime_app_flutter/common/data/error/exception_handler.dart';
import 'package:anime_app_flutter/common/data/network/api_constants.dart';
import 'package:anime_app_flutter/common/data/network/error_message_model.dart';
import 'package:anime_app_flutter/movie/domain/models/popular_movie_model.dart';
import 'package:anime_app_flutter/movie/domain/models/top_rated_movide_model.dart';
import 'package:anime_app_flutter/movie/domain/models/upcoming_movie_model.dart';
import 'package:dio/dio.dart';

abstract class MovieRemoteDataSource {
  Future<TopRatedModel> getTopRatedMovie(int page);
  Future<PopularMovieModel> getPopularMovie(int page);
  Future<UpcomingMovieModel> getUpcomingMovie(int page);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  @override
  Future<PopularMovieModel> getPopularMovie(int page) async {
    var dio = Dio();
    dio.options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzODA1Yzg2Y2Y4NWQwZGQzZWY3ZGU5Zjg0NGUxM2VmOCIsInN1YiI6IjYxNmVmZTZjMTNhMzIwMDA0NGUxMWNjNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.s0rSpqxHoPwtV7yVKmovRT2dPcAw_xPVI6l1yCijak8';
    dio.options.headers['accept'] = 'application/json';
    final response = await dio.get(ApiConstants.getPopularMovie(page));
    if (response.statusCode == 200) {
      return PopularMovieModel.fromJson(response.data);
    } else {
      throw ExceptionHandlder(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<TopRatedModel> getTopRatedMovie(int page) async {
    var dio = Dio();
    dio.options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzODA1Yzg2Y2Y4NWQwZGQzZWY3ZGU5Zjg0NGUxM2VmOCIsInN1YiI6IjYxNmVmZTZjMTNhMzIwMDA0NGUxMWNjNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.s0rSpqxHoPwtV7yVKmovRT2dPcAw_xPVI6l1yCijak8';
    dio.options.headers['accept'] = 'application/json';
    final response = await dio.get(ApiConstants.getTopRatedMovies(page));
    if (response.statusCode == 200) {
      return TopRatedModel.fromJson(response.data);
    } else {
      throw ExceptionHandlder(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<UpcomingMovieModel> getUpcomingMovie(int page) async {
    var dio = Dio();
    dio.options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzODA1Yzg2Y2Y4NWQwZGQzZWY3ZGU5Zjg0NGUxM2VmOCIsInN1YiI6IjYxNmVmZTZjMTNhMzIwMDA0NGUxMWNjNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.s0rSpqxHoPwtV7yVKmovRT2dPcAw_xPVI6l1yCijak8';
    dio.options.headers['accept'] = 'application/json';
    final response = await dio.get(ApiConstants.getUpcomingMovie(page));
    if (response.statusCode == 200) {
      return UpcomingMovieModel.fromJson(response.data);
    } else {
      throw ExceptionHandlder(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
