import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:manga_clean_arch/core/clients/network/network_client.dart';
import 'package:manga_clean_arch/feature/favorites/data/datasources/local/favorites_cache_client.dart';
import 'package:manga_clean_arch/feature/favorites/data/datasources/local/favorites_local_datasource.dart';
import 'package:manga_clean_arch/feature/favorites/data/repositories/favorites_repository_impl.dart';
import 'package:manga_clean_arch/feature/favorites/domain/repositories/favorites_repository.dart';
import 'package:manga_clean_arch/feature/favorites/domain/usecases/uc_add_or_remove_favorite.dart';
import 'package:manga_clean_arch/feature/favorites/domain/usecases/uc_get_favorites.dart';
import 'package:manga_clean_arch/feature/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:manga_clean_arch/feature/popular/data/datasources/remote/popular_remote_datasource.dart';
import 'package:manga_clean_arch/feature/popular/data/repositories/popular_repository_impl.dart';
import 'package:manga_clean_arch/feature/popular/domain/repositories/popular_repository.dart';
import 'package:manga_clean_arch/feature/popular/domain/usecases/uc_get_popular_mangas.dart';
import 'package:manga_clean_arch/feature/popular/presentation/bloc/popular_bloc.dart';
import 'package:manga_clean_arch/feature/search/data/datasources/remote/search_remote_datasource.dart';
import 'package:manga_clean_arch/feature/search/data/repositories/search_repository_impl.dart';
import 'package:manga_clean_arch/feature/search/domain/repositories/search_repository.dart';
import 'package:manga_clean_arch/feature/search/domain/usecases/uc_search_mangas.dart';
import 'package:manga_clean_arch/feature/search/presentation/bloc/search_bloc.dart';

abstract final class Locator {
  static final instance = GetIt.instance;

  static Future<void> locateServices({required String baseUrl}) async {
    // Blocs
    instance
      ..registerFactory(() => PopularBloc(getPopularMangas: instance()))
      ..registerFactory(() => SearchBloc(searchMangas: instance()))
      ..registerFactory(() => FavoritesBloc(getFavorites: instance(), addOrRemoveFavorite: instance()))
      // Usecases
      ..registerFactory(() => UCGetPopularMangas(repository: instance()))
      ..registerFactory(() => UCSearchMangas(repository: instance()))
      ..registerFactory(() => UCGetFavorites(repository: instance()))
      ..registerFactory(() => UCAddOrRemoveFavorite(repository: instance()))
      // Repositories
      ..registerFactory<PopularRepository>(() => PopularRepositoryImpl(dataSource: instance()))
      ..registerFactory<SearchRepository>(() => SearchRepositoryImpl(dataSource: instance()))
      ..registerFactory<FavoritesRepository>(() => FavoritesRepositoryImpl(dataSource: instance()))
      // RemoteDataSources
      ..registerFactory(() => PopularRemoteDataSource(networkClient: instance()))
      ..registerFactory(() => SearchRemoteDataSource(networkClient: instance()))
      // LocalDataSources
      ..registerFactory(() => FavoritesLocalDataSource(cacheClient: instance()))
      // Clients
      ..registerLazySingleton(FavoritesCacheClient.new)
      ..registerLazySingleton(() => NetworkClient(dio: instance(), baseUrl: baseUrl))

      // Client Dependencies
      ..registerFactory(Dio.new);

    // Initialize Clients
    await instance<FavoritesCacheClient>().init();
  }
}
