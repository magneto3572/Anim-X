import 'package:equatable/equatable.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();
}

class GetBookEvent extends BookEvent {
  const GetBookEvent();
  @override
  List<Object?> get props => [];
}

