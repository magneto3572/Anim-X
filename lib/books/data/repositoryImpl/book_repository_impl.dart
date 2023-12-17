

import 'package:anime_app_flutter/books/data/datasource/book_remote_data_source.dart';
import 'package:anime_app_flutter/books/domain/models/book_model.dart';
import 'package:anime_app_flutter/books/domain/repository/bookRepository.dart';
import 'package:anime_app_flutter/common/data/error/exception_handler.dart';
import 'package:anime_app_flutter/common/data/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class BookRepositoryImpl extends BookRespository {
  final BookRemoteDataSource _bookRemoteDataSource;

  BookRepositoryImpl(this._bookRemoteDataSource);

  @override
  Future<Either<Failure, List<BooksModel>>> getBookList() async {
    try {
      final result = await _bookRemoteDataSource.getBookList();
      return Right(result);
    } on ExceptionHandlder catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message!));
    } on DioException catch (failure) {
      return Left(ServerFailure(failure.message.toString()));
    }
  }
}
