import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manga_clean_arch/app/errors/failures/failures.dart';
import 'package:manga_clean_arch/feature/favorites/data/datasources/local/favorites_local_datasource.dart';
import 'package:manga_clean_arch/feature/favorites/data/repositories/favorites_repository_impl.dart';
import 'package:manga_clean_arch/feature/favorites/domain/repositories/favorites_repository.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';
import 'package:mocktail/mocktail.dart';

class MockFavoriteLocalDataSource extends Mock implements FavoritesLocalDataSource {}

class MockMangaEntity extends Mock implements MangaEntity {}

void main() {
  late MockFavoriteLocalDataSource dataSource;
  late FavoritesRepository repository;
  late List<MockMangaEntity> mockEntity;

  setUp(() {
    dataSource = MockFavoriteLocalDataSource();
    repository = FavoritesRepositoryImpl(dataSource: dataSource);
    mockEntity = List.generate(50, (_) => MockMangaEntity());
  });

  test('Returns Right with List of MangaEntities when there is no exception', () async {
    when(() => dataSource.getFavorites()).thenReturn(mockEntity);
    final result = repository.getFavorites();

    verify(() => dataSource.getFavorites());

    expect(result, isA<Right<Failure, List<MangaEntity>>>());
  });

  test('Returns Left with Failure type when an exception caught', () async {
    when(() => dataSource.getFavorites()).thenThrow(Exception());
    final result = repository.getFavorites();

    verify(() => dataSource.getFavorites());

    expect(result, isA<Left<Failure, List<MangaEntity>>>());
  });
}
