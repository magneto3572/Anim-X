
import 'package:anime_app_flutter/common/domain/utils/enums.dart';
import 'package:anime_app_flutter/movie/domain/models/popular_movie_model.dart';
import 'package:anime_app_flutter/movie/domain/models/top_rated_movide_model.dart';
import 'package:anime_app_flutter/movie/domain/models/upcoming_movie_model.dart';
import 'package:equatable/equatable.dart';

class MovieState extends Equatable {
  final TopRatedModel? topRatedModel;
  final UpcomingMovieModel? upcomingMovieModel;
  final PopularMovieModel? popularMovieModel;
  final RequestStatus status;
  final String message;

  const MovieState({
    this.topRatedModel,
    this.upcomingMovieModel,
    this.popularMovieModel,
    this.status = RequestStatus.loading,
    this.message = '',
  });

  MovieState copyWith({
    TopRatedModel? topRatedModel,
    UpcomingMovieModel? upcomingMovieModel,
    PopularMovieModel? popularMovieModel,
    RequestStatus? status,
    String? message,
  }) {
    return MovieState(
      topRatedModel: topRatedModel ?? this.topRatedModel,
      upcomingMovieModel: upcomingMovieModel ?? this.upcomingMovieModel,
      popularMovieModel: popularMovieModel ?? this.popularMovieModel,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        topRatedModel,
        upcomingMovieModel,
        popularMovieModel,
        status,
        message,
      ];
}