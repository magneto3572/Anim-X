import 'dart:async';

import 'package:anime_app_flutter/common/domain/usecase/base_use_case.dart';
import 'package:anime_app_flutter/common/domain/utils/enums.dart';
import 'package:anime_app_flutter/manga/presentation/bloc/manga_event.dart';
import 'package:anime_app_flutter/manga/presentation/bloc/manga_state.dart';
import 'package:anime_app_flutter/manga/domain/usecases/get_movies_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MangaBloc extends Bloc<MangaEvent, MangaState> {

 final GetTrendingMangaUseCase _getTrendingMangaUseCase;

  MangaBloc(
    this._getTrendingMangaUseCase,
  ) : super(const MangaState()) {
    on<MangaEvent>(_getTrendingManga);
  }

  Future<void> _getTrendingManga(
      MangaEvent event, Emitter<MangaState> emit) async {
    emit(
      state.copyWith(
        status: RequestStatus.loading,
      ),
    );
    final result = await _getTrendingMangaUseCase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          status: RequestStatus.error,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: RequestStatus.loaded,
          mangaAiringModel: r,
        ),
      ),
    );
  }
}
