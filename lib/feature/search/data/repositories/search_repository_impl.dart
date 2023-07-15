import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:manga_clean_arch/app/errors/exceptions/exceptions.dart';
import 'package:manga_clean_arch/app/errors/failures/failures.dart';
import 'package:manga_clean_arch/feature/popular/data/models/manga/manga_model.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';
import 'package:manga_clean_arch/feature/search/data/datasources/remote/search_remote_datasource.dart';
import 'package:manga_clean_arch/feature/search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl({required SearchRemoteDataSource dataSource}) : _dataSource = dataSource;
  final SearchRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, List<MangaEntity>>> searchMangas({required String query}) async {
    try {
      final response = await _dataSource.searchMangas(query: query);
      return right(response.map((e) => e.toMangaEntity()).toList());
    } on DioException {
      return left(NetworkFailure());
    } on NullResponseException {
      return left(NullResponseFailure());
    } catch (e) {
      debugPrint(e.toString());
      return left(UnknownFailure());
    }
  }
}
