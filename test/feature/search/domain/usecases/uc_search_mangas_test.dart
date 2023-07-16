import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manga_clean_arch/app/errors/failures/failures.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';
import 'package:manga_clean_arch/feature/search/domain/repositories/search_repository.dart';
import 'package:manga_clean_arch/feature/search/domain/usecases/uc_search_mangas.dart';

import 'package:mocktail/mocktail.dart';

class MockSearchRepository extends Mock implements SearchRepository {}

class MockMangaEntity extends Mock implements MangaEntity {}

void main() {
  late MockSearchRepository repository;
  late UCSearchMangas uc;
  late List<MockMangaEntity> mockEntity;
  late String query;

  setUp(() {
    repository = MockSearchRepository();
    uc = UCSearchMangas(repository: repository);
    mockEntity = List.generate(50, (_) => MockMangaEntity());
    query = 'berserk';
  });

  test('Returns Right with List of MangaEntities when there is no exception', () async {
    when(() => repository.searchMangas(query: query)).thenAnswer((_) async => Right(mockEntity));
    final result = await uc(query: query);

    verify(() => uc(query: query));
    expect(result, isA<Right<Failure, List<MangaEntity>>>());
  });

  test('Returns Left with Failure type when an exception caught', () async {
    when(() => repository.searchMangas(query: query)).thenAnswer((_) async => Left(UnknownFailure()));
    final result = await uc(query: query);

    verify(() => uc(query: query));
    expect(result, isA<Left<Failure, List<MangaEntity>>>());
  });
}
