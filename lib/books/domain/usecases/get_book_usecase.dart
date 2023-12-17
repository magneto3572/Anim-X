import 'package:anime_app_flutter/books/domain/models/book_model.dart';
import 'package:anime_app_flutter/books/domain/repository/bookRepository.dart';
import 'package:anime_app_flutter/common/data/error/failure.dart';
import 'package:anime_app_flutter/common/domain/usecase/base_use_case.dart';
import 'package:dartz/dartz.dart';

class GetBookUsecase extends BaseUseCase<List<BooksModel>, NoParameters> {
  final BookRespository _bookRespository;

  GetBookUsecase(this._bookRespository);

  @override
  Future<Either<Failure, List<BooksModel>>> call(NoParameters p) async {
    return await _bookRespository.getBookList();
  }
}
