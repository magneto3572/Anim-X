import 'package:anime_app_flutter/anime/domain/models/TopMangaModel.dart';
import 'package:anime_app_flutter/common/data/error/exception_handler.dart';
import 'package:anime_app_flutter/common/data/network/api_constants.dart';
import 'package:anime_app_flutter/common/data/network/error_message_model.dart';
import 'package:anime_app_flutter/anime/domain/models/TopAiringAnimeModel.dart';
import 'package:dio/dio.dart';

abstract class MangaRemoteDataSource {
  Future<TopAiringAnimeModel> getTopAiringAnime();
  Future<TopMangaModel> getTopManga();
}

class MangaRemoteDataSourceImpl extends MangaRemoteDataSource {
  @override
  Future<TopAiringAnimeModel> getTopAiringAnime() async {
    final response = await Dio().get(ApiConstants.getAiringManga());
    if (response.statusCode == 200) {
      return TopAiringAnimeModel.fromJson(response.data);
    } else {
      throw ExceptionHandlder(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<TopMangaModel> getTopManga() async {
    final response = await Dio().get(ApiConstants.getFeaturedManga());
    if (response.statusCode == 200) {
      return TopMangaModel.fromJson(response.data);
    } else {
      throw ExceptionHandlder(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
