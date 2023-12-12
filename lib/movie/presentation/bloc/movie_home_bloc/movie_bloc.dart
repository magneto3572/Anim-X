import 'dart:async';

import 'package:anime_app_flutter/common/data/error/failure.dart';
import 'package:anime_app_flutter/common/domain/utils/enums.dart';
import 'package:anime_app_flutter/movie/domain/models/popular_movie_model.dart';
import 'package:anime_app_flutter/movie/domain/models/top_rated_movide_model.dart';
import 'package:anime_app_flutter/movie/domain/models/upcoming_movie_model.dart';
import 'package:anime_app_flutter/movie/domain/usecases/get_popular_movie_usecase.dart';
import 'package:anime_app_flutter/movie/domain/usecases/get_top_rated_usecase.dart';
import 'package:anime_app_flutter/movie/domain/usecases/get_upcoming_movie_usecase.dart';
import 'package:anime_app_flutter/movie/presentation/bloc/movie_home_bloc/movie_event.dart';
import 'package:anime_app_flutter/movie/presentation/bloc/movie_home_bloc/movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetTopRatedUseCase _getTopRatedUseCase;
  final GetPopularMovieUseCase _getPopularMovieUseCase;
  final GetUpcomingMovieUseCase _getUpcomingMovieUseCase;

  MovieBloc(this._getTopRatedUseCase, this._getPopularMovieUseCase,
      this._getUpcomingMovieUseCase)
      : super(const MovieState()) {
    on<GetMovieEvent>(_getCombindedApiCallEvent);
  }

  Future<void> _getCombindedApiCallEvent(MovieEvent event, Emitter<MovieState> emit) async {
    emit(
      state.copyWith(
        status: RequestStatus.loading,
      ),
    );

    final results = await Future.wait([
      _getTopRatedUseCase(event.id),
      _getPopularMovieUseCase(event.id),
      _getUpcomingMovieUseCase(event.id)
    ]);

    void handleError(Failure failure) {
      emit(
        state.copyWith(
          status: RequestStatus.error,
          message: failure.message,
        ),
      );
    }

    results[0].fold(
      (l) => handleError(l),
      (r) => emit(
        state.copyWith(
          status: RequestStatus.loaded,
          topRatedModel: r as TopRatedModel,
        ),
      ),
    );

    results[1].fold(
      (l) => handleError(l),
      (r) => emit(
        state.copyWith(
          status: RequestStatus.loaded,
          popularMovieModel: r as PopularMovieModel,
        ),
      ),
    );

    results[2].fold(
      (l) => handleError(l),
      (r) => emit(
        state.copyWith(
          status: RequestStatus.loaded,
          upcomingMovieModel: r as UpcomingMovieModel,
        ),
      ),
    );
  }
}
