

import 'package:anime_app_flutter/books/domain/models/book_model.dart';
import 'package:anime_app_flutter/common/data/error/exception_handler.dart';
import 'package:anime_app_flutter/common/data/network/api_constants.dart';
import 'package:anime_app_flutter/common/data/network/error_message_model.dart';
import 'package:dio/dio.dart';

abstract class BookRemoteDataSource {
  Future<List<BooksModel>> getBookList();
}

class BookRemoteDataSourceImpl extends BookRemoteDataSource {
  @override
  Future<List<BooksModel>> getBookList() async {
    var dio = Dio();
    dio.options.headers['X-RapidAPI-Key'] =
        'eb9ee04c89msh4409b314632bd3bp1ef4efjsn6d5926bc23bd';
    dio.options.headers['X-RapidAPI-Host'] = 'myanimelist.p.rapidapi.com';
    final response = await dio.get(ApiConstants.getTopManga());
    if (response.statusCode == 200) {
     final List<dynamic> jsonList = response.data;
        return jsonList.map((json) => BooksModel.fromJson(json)).toList();
    } else {
      throw ExceptionHandlder(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
