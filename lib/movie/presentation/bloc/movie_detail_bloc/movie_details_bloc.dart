import 'package:anime_app_flutter/common/data/error/failure.dart';
import 'package:anime_app_flutter/common/domain/utils/enums.dart';
import 'package:anime_app_flutter/movie/domain/models/movie_detail_model.dart';
import 'package:anime_app_flutter/movie/domain/usecases/get_movie_detail_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailEvent, MovieDetailsState> {
  final GetMovieDetailUsecase _getMovieDetailUsecase;

   MovieDetailsBloc(this._getMovieDetailUsecase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailEvent>(_getMovieDetailsById);
  }

  Future<void> _getMovieDetailsById(MovieDetailEvent event, Emitter<MovieDetailsState> emit) async {
    emit(
      state.copyWith(
        status: RequestStatus.loading,
      ),
    );

    void handleError(Failure failure) {
      emit(
        state.copyWith(
          status: RequestStatus.error,
          message: failure.message,
        ),
      );
    }
    
    final result = await _getMovieDetailUsecase(event.id);
  
    result.fold(
      (l) => handleError(l),
      (r) => emit(
        state.copyWith(
          status: RequestStatus.loaded,
          movieDetails: r,
        ),
      ),
    );
  }
}
