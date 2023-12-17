
import 'package:anime_app_flutter/books/domain/models/book_model.dart';
import 'package:anime_app_flutter/common/data/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BookRespository {
  Future<Either<Failure, List<BooksModel>>> getBookList();
}