import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:manga_clean_arch/core/clients/network/network_client.dart';
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

  static void locateServices({required String baseUrl}) {
    // Blocs
    instance
      ..registerFactory(() => PopularBloc(getPopularMangas: instance()))
      ..registerFactory(() => SearchBloc(searchMangas: instance()))
      // Usecases
      ..registerFactory(() => UCGetPopularMangas(repository: instance()))
      ..registerFactory(() => UCSearchMangas(repository: instance()))
      // Repositories
      ..registerFactory<PopularRepository>(() => PopularRepositoryImpl(dataSource: instance()))
      ..registerFactory<SearchRepository>(() => SearchRepositoryImpl(dataSource: instance()))
      // RemoteDataSources
      ..registerFactory(() => PopularRemoteDataSource(networkClient: instance()))
      ..registerFactory(() => SearchRemoteDataSource(networkClient: instance()))
      // Clients
      ..registerLazySingleton(() => NetworkClient(dio: instance(), baseUrl: baseUrl))
      // Client Dependencies
      ..registerFactory(Dio.new);
  }
}
