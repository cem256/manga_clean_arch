import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:manga_clean_arch/app/errors/exceptions/exceptions.dart';
import 'package:manga_clean_arch/app/errors/failures/failures.dart';
import 'package:manga_clean_arch/core/utils/logger/logger_utils.dart';
import 'package:manga_clean_arch/feature/popular/data/datasources/remote/popular_remote_datasource.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';
import 'package:manga_clean_arch/feature/popular/domain/repositories/popular_repository.dart';

final class PopularRepositoryImpl implements PopularRepository {
  PopularRepositoryImpl({required PopularRemoteDataSource dataSource}) : _dataSource = dataSource;

  final PopularRemoteDataSource _dataSource;
  @override
  // Gets list of popular mangas from the remote data source. and returns a list of [MangaEntity] or a [Failure].
  Future<Either<Failure, List<MangaEntity>>> getPopularMangas({required int page, required int limit}) async {
    try {
      // Get list of [MangaModel] from the remote data source.
      final response = await _dataSource.getPopularMangas(page: page, limit: limit);
      // Map the list of [MangaModel] to a list of [MangaEntity].
      return right(response.map((e) => e.toEntity()).toList());
      // On DioException, return a [NetworkFailure].
    } on DioException {
      return left(NetworkFailure());
      // On NullResponseException, return a [NullResponseFailure].
    } on NullResponseException {
      return left(NullResponseFailure());
      // On any other exception, return a [UnknownFailure] and print the error.
    } catch (e) {
      LoggerUtils.instance.logError('Error on getPopularMangas $e');
      return left(UnknownFailure());
    }
  }
}
