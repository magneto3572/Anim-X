

import 'package:anime_app_flutter/books/domain/models/book_model.dart';
import 'package:anime_app_flutter/common/domain/utils/enums.dart';
import 'package:equatable/equatable.dart';

class BookState extends Equatable {
  final List<BooksModel>? booksModel;
  final RequestStatus status;
  final String message;

  const BookState({
    this.booksModel,
    this.status = RequestStatus.loading,
    this.message = '',
  });

  BookState copyWith({
    List<BooksModel>? booksModel,
    RequestStatus? status,
    String? message,
  }) {
    return BookState(
      booksModel: booksModel ?? booksModel,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        booksModel,
        status,
        message,
      ];
}