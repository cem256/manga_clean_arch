import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:manga_clean_arch/app/errors/exceptions/exceptions.dart';
import 'package:manga_clean_arch/app/errors/failures/failures.dart';
import 'package:manga_clean_arch/feature/popular/data/datasources/remote/popular_remote_datasource.dart';
import 'package:manga_clean_arch/feature/popular/data/models/manga/manga_model.dart';
import 'package:manga_clean_arch/feature/popular/data/repositories/popular_repository_impl.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';
import 'package:manga_clean_arch/feature/popular/domain/repositories/popular_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockPopularRemoteDataSource extends Mock implements PopularRemoteDataSource {}

void main() {
  late MockPopularRemoteDataSource dataSource;
  late PopularRepository repository;
  late List<MangaModel> mockModel;
  late int page;
  late int limit;

  setUp(() {
    page = 1;
    limit = 20;
    dataSource = MockPopularRemoteDataSource();
    repository = PopularRepositoryImpl(dataSource: dataSource);
    mockModel = List.generate(
      limit,
      (_) => const MangaModel(
        title: 'Berserk',
      ),
    );
  });

  test('Returns Right with List of MangaEntities when there is no exception', () async {
    when(() => dataSource.getPopularMangas(page: page, limit: limit)).thenAnswer((_) async => mockModel);
    final result = await repository.getPopularMangas(page: page, limit: limit);

    verify(() => dataSource.getPopularMangas(page: page, limit: limit)).called(1);

    expect(result, isA<Right<Failure, List<MangaEntity>>>());
    result.fold(
      (failure) => fail('Expected Right but got Left with $failure'),
      (mangas) {
        expect(mangas, isA<List<MangaEntity>>());
        expect(mangas.length, mockModel.length);
      },
    );
  });

  test('Returns Left with NetworkFailure when DioException is thrown', () async {
    when(() => dataSource.getPopularMangas(page: page, limit: limit))
        .thenThrow(DioException(requestOptions: RequestOptions()));
    final result = await repository.getPopularMangas(page: page, limit: limit);

    verify(() => dataSource.getPopularMangas(page: page, limit: limit)).called(1);

    expect(result, isA<Left<Failure, List<MangaEntity>>>());
    result.fold(
      (failure) => expect(failure, isA<NetworkFailure>()),
      (mangas) => fail('Expected Left but got Right with $mangas'),
    );
  });

  test('Returns Left with NullResponseFailure when NullResponseException is thrown', () async {
    when(() => dataSource.getPopularMangas(page: page, limit: limit)).thenThrow(NullResponseException());
    final result = await repository.getPopularMangas(page: page, limit: limit);

    verify(() => dataSource.getPopularMangas(page: page, limit: limit)).called(1);

    expect(result, isA<Left<Failure, List<MangaEntity>>>());
    result.fold(
      (failure) => expect(failure, isA<NullResponseFailure>()),
      (mangas) => fail('Expected Left but got Right with $mangas'),
    );
  });

  test('Returns Left with UnknownFailure when an unknown exception is thrown', () async {
    when(() => dataSource.getPopularMangas(page: page, limit: limit)).thenThrow(Exception('Unknown error'));
    final result = await repository.getPopularMangas(page: page, limit: limit);

    verify(() => dataSource.getPopularMangas(page: page, limit: limit)).called(1);

    expect(result, isA<Left<Failure, List<MangaEntity>>>());
    result.fold(
      (failure) => expect(failure, isA<UnknownFailure>()),
      (mangas) => fail('Expected Left but got Right with $mangas'),
    );
  });
}
