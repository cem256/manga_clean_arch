import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:manga_clean_arch/app/errors/failures/failures.dart';
import 'package:manga_clean_arch/feature/favorites/domain/repositories/favorites_repository.dart';
import 'package:manga_clean_arch/feature/favorites/domain/usecases/uc_get_favorites.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';
import 'package:mocktail/mocktail.dart';

class MockFavoriteRepository extends Mock implements FavoritesRepository {}

class MockMangaEntity extends Mock implements MangaEntity {}

void main() {
  late MockFavoriteRepository repository;
  late UCGetFavorites uc;
  late List<MockMangaEntity> mockEntity;

  setUp(() {
    repository = MockFavoriteRepository();
    uc = UCGetFavorites(repository: repository);
    mockEntity = List.generate(50, (_) => MockMangaEntity());
  });

  test('Returns Right with List of MangaEntities when there is no exception', () async {
    when(() => repository.getFavorites()).thenReturn(Right(mockEntity));
    final result = uc();

    verify(() => uc());
    expect(result, isA<Right<Failure, List<MangaEntity>>>());
  });

  test('Returns Left with Failure type when an exception caught', () async {
    when(() => repository.getFavorites()).thenReturn(Left(UnknownFailure()));
    final result = uc();

    verify(() => uc());
    expect(result, isA<Left<Failure, List<MangaEntity>>>());
  });
}
