import 'dart:async';

import 'package:anime_app_flutter/anime/domain/models/manga_airing_model.dart';
import 'package:anime_app_flutter/anime/domain/models/manga_featured_model.dart';
import 'package:anime_app_flutter/anime/domain/usecases/get_featured_manga_usecase.dart';
import 'package:anime_app_flutter/anime/domain/usecases/get_trending_manga_usecase.dart';
import 'package:anime_app_flutter/anime/presentation/bloc/animeHomeBloc/manga_state.dart';
import 'package:anime_app_flutter/common/data/error/failure.dart';
import 'package:anime_app_flutter/common/domain/usecase/base_use_case.dart';
import 'package:anime_app_flutter/common/domain/utils/enums.dart';
import 'package:anime_app_flutter/anime/presentation/bloc/animeHomeBloc/manga_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MangaBloc extends Bloc<MangaEvent, MangaState> {
  final GetTrendingMangaUseCase _getTrendingMangaUseCase;
  final GetFeaturedMangaUseCase _getFeaturedMangaUseCase;

  MangaBloc(this._getTrendingMangaUseCase, this._getFeaturedMangaUseCase)
      : super(const MangaState()) {
    on<MangaEvent>(_getCombindedApiCallEvent);
  }

  Future<void> _getCombindedApiCallEvent(
      MangaEvent event, Emitter<MangaState> emit) async {
    emit(
      state.copyWith(
        status: RequestStatus.loading,
      ),
    );

    final results = await Future.wait([
      _getTrendingMangaUseCase(const NoParameters()),
      _getFeaturedMangaUseCase(const NoParameters())
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
          mangaAiringModel: r as MangaAiringModel,
        ),
      ),
    );

    results[1].fold(
      (l) => handleError(l),
      (r) => emit(
        state.copyWith(
          status: RequestStatus.loaded,
          featuredMangaModel: r as FeaturedMangaModel,
        ),
      ),
    );
  }
}
