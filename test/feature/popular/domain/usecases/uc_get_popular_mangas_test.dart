import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:manga_clean_arch/app/errors/failures/failures.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';
import 'package:manga_clean_arch/feature/popular/domain/repositories/popular_repository.dart';
import 'package:manga_clean_arch/feature/popular/domain/usecases/uc_get_popular_mangas.dart';
import 'package:mocktail/mocktail.dart';

class MockPopularRepository extends Mock implements PopularRepository {}

class MockMangaEntity extends Mock implements MangaEntity {}

void main() {
  late MockPopularRepository repository;
  late UCGetPopularMangas uc;
  late List<MockMangaEntity> mockEntity;
  late int page;
  late int limit;

  setUp(() {
    page = 1;
    limit = 50;
    repository = MockPopularRepository();
    uc = UCGetPopularMangas(repository: repository);
    mockEntity = List.generate(limit, (_) => MockMangaEntity());
  });

  test('Returns Right with List of MangaEntities when there is no exception', () async {
    when(() => repository.getPopularMangas(page: page, limit: limit)).thenAnswer((_) async => Right(mockEntity));
    final result = await uc(page: page, limit: limit);

    verify(() => uc(page: page, limit: limit));
    expect(result, isA<Right<Failure, List<MangaEntity>>>());
  });

  test('Returns Left with Failure type when an exception caught', () async {
    when(() => repository.getPopularMangas(page: page, limit: limit)).thenAnswer((_) async => Left(UnknownFailure()));
    final result = await uc(page: page, limit: limit);

    verify(() => uc(page: page, limit: limit));
    expect(result, isA<Left<Failure, List<MangaEntity>>>());
  });
}
