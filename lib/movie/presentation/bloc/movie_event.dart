import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  final int id;
  const MovieEvent(this.id);
}

class GetMovieEvent extends MovieEvent {
  const GetMovieEvent(super.id);
  
  @override
  List<Object?> get props => [id];
}


