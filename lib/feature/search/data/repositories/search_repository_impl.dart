import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:manga_clean_arch/app/errors/exceptions/exceptions.dart';
import 'package:manga_clean_arch/app/errors/failures/failures.dart';
import 'package:manga_clean_arch/feature/popular/data/models/manga/manga_model.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';
import 'package:manga_clean_arch/feature/search/data/datasources/remote/search_remote_datasource.dart';
import 'package:manga_clean_arch/feature/search/domain/repositories/search_repository.dart';

final class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl({required SearchRemoteDataSource dataSource}) : _dataSource = dataSource;
  final SearchRemoteDataSource _dataSource;

  @override
  // Gets list of mangas matches the given query
  // from the remote data source and returns a list of [MangaEntity] or a [Failure].
  Future<Either<Failure, List<MangaEntity>>> searchMangas({required String query}) async {
    try {
      // Get list of [MangaModel] from the remote data source.
      final response = await _dataSource.searchMangas(query: query);
      // Map the list of [MangaModel] to a list of [MangaEntity].
      return right(response.map((e) => e.toMangaEntity()).toList());
      // On DioException, return a [NetworkFailure].
    } on DioException {
      return left(NetworkFailure());
      // On NullResponseException, return a [NullResponseFailure].
    } on NullResponseException {
      return left(NullResponseFailure());
      // On any other exception, return a [UnknownFailure] and print the error.
    } catch (e) {
      debugPrint(e.toString());
      return left(UnknownFailure());
    }
  }
}
