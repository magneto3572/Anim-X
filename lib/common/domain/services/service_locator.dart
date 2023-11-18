import 'package:anime_app_flutter/anime/data/datasource/manga_remote_data_source.dart';
import 'package:anime_app_flutter/anime/data/repositoryImpl/manga_repository_impl.dart';
import 'package:anime_app_flutter/anime/domain/repository/mangaRepository.dart';
import 'package:anime_app_flutter/anime/domain/usecases/get_featured_manga_usecase.dart';
import 'package:anime_app_flutter/anime/domain/usecases/get_trending_manga_usecase.dart';
import 'package:anime_app_flutter/anime/presentation/bloc/animeHomeBloc/manga_bloc.dart';
import 'package:anime_app_flutter/movie/data/datasource/movie_remote_data_source.dart';
import 'package:anime_app_flutter/movie/data/repository_impl/movie_repository_impl.dart';
import 'package:anime_app_flutter/movie/domain/repository/MovieRepository.dart';
import 'package:anime_app_flutter/movie/domain/usecases/get_popular_movie_usecase.dart';
import 'package:anime_app_flutter/movie/domain/usecases/get_top_rated_usecase.dart';
import 'package:anime_app_flutter/movie/domain/usecases/get_upcoming_movie_usecase.dart';
import 'package:anime_app_flutter/movie/presentation/bloc/movie_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    // Data source
    sl.registerLazySingleton<MangaRemoteDataSource>(
        () => MangaRemoteDataSourceImpl());
    sl.registerLazySingleton<MovieRemoteDataSource>(
        () => MovieRemoteDataSourceImpl());

    // Repository
    sl.registerLazySingleton<MangaRespository>(() => MangaRepositoryImpl(sl()));
    sl.registerLazySingleton<MovieRespository>(() => MovieRepositoryImpl(sl()));

    // Use Cases
    sl.registerLazySingleton(() => GetTrendingMangaUseCase(sl()));
    sl.registerLazySingleton(() => GetFeaturedMangaUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedUseCase(sl()));
    sl.registerLazySingleton(() => GetUpcomingMovieUseCase(sl()));

    // Bloc
    sl.registerFactory(() => MangaBloc(sl(), sl()));
    sl.registerFactory(() => MovieBloc(sl(), sl(), sl()));
  }
}