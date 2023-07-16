import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manga_clean_arch/app/errors/failures/failures.dart';
import 'package:manga_clean_arch/feature/popular/data/datasources/remote/popular_remote_datasource.dart';
import 'package:manga_clean_arch/feature/popular/data/models/manga/manga_model.dart';
import 'package:manga_clean_arch/feature/popular/data/repositories/popular_repository_impl.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';
import 'package:manga_clean_arch/feature/popular/domain/repositories/popular_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockPopularRemoteDataSource extends Mock implements PopularRemoteDataSource {}

class MockMangaModel extends Mock implements MangaModel {}

void main() {
  late MockPopularRemoteDataSource dataSource;
  late PopularRepository repository;
  late List<MockMangaModel> mockModel;
  late int page;
  late int limit;

  setUp(() {
    page = 1;
    limit = 20;
    dataSource = MockPopularRemoteDataSource();
    repository = PopularRepositoryImpl(dataSource: dataSource);
    mockModel = List.generate(limit, (_) => MockMangaModel());
  });

  test('Returns Right with List of MangaEntities when there is no exception', () async {
    when(() => dataSource.getPopularMangas(page: page, limit: limit)).thenAnswer((_) async => mockModel);
    final result = await repository.getPopularMangas(page: page, limit: limit);

    verify(() => dataSource.getPopularMangas(page: page, limit: limit));

    expect(result, isA<Right<Failure, List<MangaEntity>>>());
  });

  test('Returns Left with Failure type when an exception caught', () async {
    when(() => dataSource.getPopularMangas(page: page, limit: limit)).thenThrow(Exception());
    final result = await repository.getPopularMangas(page: page, limit: limit);

    verify(() => dataSource.getPopularMangas(page: page, limit: limit));

    expect(result, isA<Left<Failure, List<MangaEntity>>>());
  });
}
