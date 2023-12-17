import 'dart:async';

import 'package:anime_app_flutter/books/domain/usecases/get_book_usecase.dart';
import 'package:anime_app_flutter/books/presentation/bloc/book_event.dart';
import 'package:anime_app_flutter/books/presentation/bloc/book_state.dart';
import 'package:anime_app_flutter/common/data/error/failure.dart';
import 'package:anime_app_flutter/common/domain/usecase/base_use_case.dart';
import 'package:anime_app_flutter/common/domain/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final GetBookUsecase _getBookUsecase;

  BookBloc(this._getBookUsecase) : super(const BookState()) {
    on<GetBookEvent>(_getCombindedApiCallEvent);
  }

  Future<void> _getCombindedApiCallEvent(
      BookEvent event, Emitter<BookState> emit) async {
    emit(
      state.copyWith(
        status: RequestStatus.loading,
      ),
    );

    final results = await Future.wait([_getBookUsecase(const NoParameters())]);

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
              state.copyWith(status: RequestStatus.loaded, booksModel: r),
            ));
  }
}
