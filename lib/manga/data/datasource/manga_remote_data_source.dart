

import 'package:anime_app_flutter/common/data/error/exception_handler.dart';
import 'package:anime_app_flutter/common/data/network/api_constants.dart';
import 'package:anime_app_flutter/common/data/network/error_message_model.dart';
import 'package:anime_app_flutter/manga/domain/models/manga_airing_model.dart';
import 'package:dio/dio.dart';

abstract class MangaRemoteDataSource {
  Future<MangaAiringModel> getTrendingManga();
}

class MangaRemoteDataSourceImpl extends MangaRemoteDataSource {
  @override
  Future<MangaAiringModel> getTrendingManga() async {
    final response = await Dio().get(ApiConstants.getAiringManga);
    if (response.statusCode == 200) {
      return  MangaAiringModel.fromJson(response.data);
    } else {
      throw ExceptionHandlder(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
