part of 'movie_details_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  final int id;
  const MovieDetailEvent(this.id);
}

class GetMovieDetailEvent extends MovieDetailEvent {
  const GetMovieDetailEvent(super.id);
  
  @override
  List<Object?> get props => [id];
  
}
