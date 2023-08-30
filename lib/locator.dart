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

/// [Locator] is responsible for locating and registering all the
/// services of the application.
abstract final class Locator {
  /// [GetIt] instance
  static final _instance = GetIt.instance;

  /// Returns instance of [PopularBloc]
  static PopularBloc get popularBloc => _instance<PopularBloc>();

  /// Returns instance of [SearchBloc]
  static SearchBloc get searchBloc => _instance<SearchBloc>();

  /// Returns instance of [FavoritesBloc]
  static FavoritesBloc get favoritesBloc => _instance<FavoritesBloc>();

  /// Responsible for registering all the dependencies
  static Future<void> locateServices({required String baseUrl}) async {
    // Blocs
    _instance
      ..registerFactory(() => PopularBloc(getPopularMangas: _instance()))
      ..registerFactory(() => SearchBloc(searchMangas: _instance()))
      ..registerFactory(() => FavoritesBloc(getFavorites: _instance(), addOrRemoveFavorite: _instance()))
      // Usecases
      ..registerFactory(() => UCGetPopularMangas(repository: _instance()))
      ..registerFactory(() => UCSearchMangas(repository: _instance()))
      ..registerFactory(() => UCGetFavorites(repository: _instance()))
      ..registerFactory(() => UCAddOrRemoveFavorite(repository: _instance()))
      // Repositories
      ..registerFactory<PopularRepository>(() => PopularRepositoryImpl(dataSource: _instance()))
      ..registerFactory<SearchRepository>(() => SearchRepositoryImpl(dataSource: _instance()))
      ..registerFactory<FavoritesRepository>(() => FavoritesRepositoryImpl(dataSource: _instance()))
      // RemoteDataSources
      ..registerFactory<PopularRemoteDataSource>(() => PopularRemoteDataSourceImpl(networkClient: _instance()))
      ..registerFactory<SearchRemoteDataSource>(() => SearchRemoteDataSourceImpl(networkClient: _instance()))
      // LocalDataSources
      ..registerFactory<FavoritesLocalDataSource>(() => FavoritesLocalDataSourceImpl(cacheClient: _instance()))
      // Clients
      ..registerLazySingleton(FavoritesCacheClient.new)
      ..registerLazySingleton(() => NetworkClient(dio: _instance(), baseUrl: baseUrl))

      // Client Dependencies
      ..registerFactory(Dio.new);

    // Initialize Clients
    await _instance<FavoritesCacheClient>().init();
  }
}
