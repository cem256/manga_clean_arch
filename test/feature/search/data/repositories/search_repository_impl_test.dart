import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:manga_clean_arch/app/errors/failures/failures.dart';
import 'package:manga_clean_arch/feature/popular/data/models/manga/manga_model.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';
import 'package:manga_clean_arch/feature/search/data/datasources/remote/search_remote_datasource.dart';
import 'package:manga_clean_arch/feature/search/data/repositories/search_repository_impl.dart';
import 'package:manga_clean_arch/feature/search/domain/repositories/search_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockSearchRemoteDataSource extends Mock implements SearchRemoteDataSource {}

class MockMangaModel extends Mock implements MangaModel {}

void main() {
  late MockSearchRemoteDataSource dataSource;
  late SearchRepository repository;
  late List<MockMangaModel> mockModel;
  late String query;

  setUp(() {
    dataSource = MockSearchRemoteDataSource();
    repository = SearchRepositoryImpl(dataSource: dataSource);
    mockModel = List.generate(50, (_) => MockMangaModel());
    query = 'berserk';
  });

  test('Returns Right with List of MangaEntities when there is no exception', () async {
    when(() => dataSource.searchMangas(query: query)).thenAnswer((_) async => mockModel);
    final result = await repository.searchMangas(query: query);

    verify(() => dataSource.searchMangas(query: query));

    expect(result, isA<Right<Failure, List<MangaEntity>>>());
  });

  test('Returns Left with Failure type when an exception caught', () async {
    when(() => dataSource.searchMangas(query: query)).thenThrow(Exception());
    final result = await repository.searchMangas(query: query);

    verify(() => dataSource.searchMangas(query: query));

    expect(result, isA<Left<Failure, List<MangaEntity>>>());
  });
}
