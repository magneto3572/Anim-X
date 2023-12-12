import 'dart:async';

import 'package:anime_app_flutter/anime/domain/models/TopAiringAnimeModel.dart';
import 'package:anime_app_flutter/anime/domain/models/TopMangaModel.dart';
import 'package:anime_app_flutter/anime/domain/usecases/get_top_airing_anime.dart';
import 'package:anime_app_flutter/anime/domain/usecases/get_top_manga.dart';
import 'package:anime_app_flutter/anime/presentation/bloc/anime_event.dart';
import 'package:anime_app_flutter/anime/presentation/bloc/anime_state.dart';
import 'package:anime_app_flutter/common/data/error/failure.dart';
import 'package:anime_app_flutter/common/domain/usecase/base_use_case.dart';
import 'package:anime_app_flutter/common/domain/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  final GetTopAiringAnimeUsecase _getTopAiringAnimeUsecase;
  final GetTopMangaUsecase _getTopMangaUsecase;

  AnimeBloc(this._getTopAiringAnimeUsecase, this._getTopMangaUsecase)
      : super(const AnimeState()) {
    on<GetAnimeEvent>(_getCombindedApiCallEvent);
  }

  Future<void> _getCombindedApiCallEvent(AnimeEvent event, Emitter<AnimeState> emit) async {
    emit(
      state.copyWith(
        status: RequestStatus.loading,
      ),
    );

    final results = await Future.wait([
      _getTopAiringAnimeUsecase(const NoParameters()),
      _getTopMangaUsecase(const NoParameters())
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
          topAnimeAiringModel: r as TopAiringAnimeModel,
        ),
      ),
    );

    results[1].fold(
      (l) => handleError(l),
      (r) => emit(
        state.copyWith(
          status: RequestStatus.loaded,
          topMangaModel: r as TopMangaModel,
        ),
      ),
    );
  }
}
