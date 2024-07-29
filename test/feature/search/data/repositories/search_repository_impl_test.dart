import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:manga_clean_arch/app/errors/exceptions/exceptions.dart';
import 'package:manga_clean_arch/app/errors/failures/failures.dart';
import 'package:manga_clean_arch/feature/popular/data/models/manga/manga_model.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';
import 'package:manga_clean_arch/feature/search/data/datasources/remote/search_remote_datasource.dart';
import 'package:manga_clean_arch/feature/search/data/repositories/search_repository_impl.dart';
import 'package:manga_clean_arch/feature/search/domain/repositories/search_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockSearchRemoteDataSource extends Mock implements SearchRemoteDataSource {}

void main() {
  late MockSearchRemoteDataSource dataSource;
  late SearchRepository repository;
  late List<MangaModel> mockModel;
  late String query;

  setUp(() {
    dataSource = MockSearchRemoteDataSource();
    repository = SearchRepositoryImpl(dataSource: dataSource);
    mockModel = List.generate(
      50,
      (_) => const MangaModel(
        title: 'Berserk',
      ),
    );
    query = 'berserk';
  });

  test('Returns Right with List of MangaEntities when there is no exception', () async {
    when(() => dataSource.searchMangas(query: query)).thenAnswer((_) async => mockModel);
    final result = await repository.searchMangas(query: query);

    verify(() => dataSource.searchMangas(query: query)).called(1);

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
    when(() => dataSource.searchMangas(query: query)).thenThrow(DioException(requestOptions: RequestOptions()));
    final result = await repository.searchMangas(query: query);

    verify(() => dataSource.searchMangas(query: query)).called(1);

    expect(result, isA<Left<Failure, List<MangaEntity>>>());
    result.fold(
      (failure) => expect(failure, isA<NetworkFailure>()),
      (mangas) => fail('Expected Left but got Right with $mangas'),
    );
  });

  test('Returns Left with NullResponseFailure when NullResponseException is thrown', () async {
    when(() => dataSource.searchMangas(query: query)).thenThrow(NullResponseException());
    final result = await repository.searchMangas(query: query);

    verify(() => dataSource.searchMangas(query: query)).called(1);

    expect(result, isA<Left<Failure, List<MangaEntity>>>());
    result.fold(
      (failure) => expect(failure, isA<NullResponseFailure>()),
      (mangas) => fail('Expected Left but got Right with $mangas'),
    );
  });

  test('Returns Left with UnknownFailure when an unknown exception is thrown', () async {
    when(() => dataSource.searchMangas(query: query)).thenThrow(Exception('Unknown error'));
    final result = await repository.searchMangas(query: query);

    verify(() => dataSource.searchMangas(query: query)).called(1);

    expect(result, isA<Left<Failure, List<MangaEntity>>>());
    result.fold(
      (failure) => expect(failure, isA<UnknownFailure>()),
      (mangas) => fail('Expected Left but got Right with $mangas'),
    );
  });
}
