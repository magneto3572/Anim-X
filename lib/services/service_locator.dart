import 'package:anime_app_flutter/manga/presentation/bloc/manga_bloc.dart';
import 'package:anime_app_flutter/manga/data/datasource/manga_remote_data_source.dart';
import 'package:anime_app_flutter/manga/data/repositoryImpl/movies_repository_impl.dart';
import 'package:anime_app_flutter/manga/domain/repository/MangaRepository.dart';
import 'package:anime_app_flutter/manga/domain/usecases/get_movies_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    // Data source
    sl.registerLazySingleton<MangaRemoteDataSource>(
        () => MangaRemoteDataSourceImpl());

    // Repository
    sl.registerLazySingleton<MangaRespository>(
        () => MangaRepositoryImpl(sl()));


    // Use Cases
    sl.registerLazySingleton(() => GetTrendingMangaUseCase(sl()));
  

    // Bloc
   sl.registerFactory(() => MangaBloc(sl()));
  
  }
}
