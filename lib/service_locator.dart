import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:manga_clean_arch/core/clients/network/network_client.dart';
import 'package:manga_clean_arch/feature/popular/data/datasources/remote/popular_remote_datasource.dart';
import 'package:manga_clean_arch/feature/popular/data/repositories/popular_repository_impl.dart';
import 'package:manga_clean_arch/feature/popular/domain/repositories/popular_repository.dart';
import 'package:manga_clean_arch/feature/popular/domain/usecases/uc_get_popular_mangas.dart';

import 'package:manga_clean_arch/feature/popular/presentation/bloc/popular_bloc.dart';

abstract final class ServiceLocator {
  static final getIt = GetIt.instance;

  static void init({required String baseUrl}) {
    // Blocs
    getIt
      ..registerFactory(() => PopularBloc(getPopularMangas: getIt()))
      // Usecases
      ..registerFactory(() => UCGetPopularMangas(repository: getIt()))
      // Repositories
      ..registerFactory<PopularRepository>(() => PopularRepositoryImpl(dataSource: getIt()))
      // RemoteDataSources
      ..registerFactory(() => PopularRemoteDataSource(networkClient: getIt()))
      // Clients
      ..registerLazySingleton(() => NetworkClient(dio: getIt(), baseUrl: baseUrl))
      // Client Dependencies
      ..registerFactory(Dio.new);
  }
}
