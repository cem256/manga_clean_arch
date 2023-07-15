import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:manga_clean_arch/app/errors/exceptions/exceptions.dart';
import 'package:manga_clean_arch/app/errors/failures/failures.dart';
import 'package:manga_clean_arch/feature/popular/data/datasources/remote/popular_remote_datasource.dart';
import 'package:manga_clean_arch/feature/popular/data/models/manga/manga_model.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';
import 'package:manga_clean_arch/feature/popular/domain/repositories/popular_repository.dart';

class PopularRepositoryImpl implements PopularRepository {
  PopularRepositoryImpl({required PopularRemoteDataSource dataSource}) : _dataSource = dataSource;

  final PopularRemoteDataSource _dataSource;
  @override
  Future<Either<Failure, List<MangaEntity>>> getPopularMangas({required int page, required int limit}) async {
    try {
      final response = await _dataSource.getPopularMangas(page: page, limit: limit);
      return right(response.map((e) => e.toMangaEntity()).toList());
    } on DioException {
      return left(NetworkFailure());
    } on NullResponseException {
      return left(NullResponseFailure());
    } catch (e) {
      log(e.toString());
      return left(UnknownFailure());
    }
  }
}
