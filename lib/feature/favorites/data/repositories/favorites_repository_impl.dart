import 'package:dartz/dartz.dart';
import 'package:manga_clean_arch/app/errors/failures/failures.dart';
import 'package:manga_clean_arch/feature/favorites/data/datasources/local/favorites_local_datasource.dart';
import 'package:manga_clean_arch/feature/favorites/domain/repositories/favorites_repository.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  FavoritesRepositoryImpl({required FavoritesLocalDataSource dataSource}) : _dataSource = dataSource;

  final FavoritesLocalDataSource _dataSource;

  @override
  Either<Failure, List<MangaEntity>> getFavorites() {
    try {
      final favorites = _dataSource.getFavorites();

      return right(favorites);
    } catch (e) {
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, List<MangaEntity>>> addOrRemoveItem(MangaEntity item) async {
    try {
      final favorites = _dataSource.getFavorites();

      if (favorites.contains(item)) {
        final index = favorites.indexOf(item);
        await _dataSource.removeFromFavorites(index);
      } else {
        await _dataSource.addToFavorites(item);
      }
      return right(_dataSource.getFavorites());
    } catch (e) {
      return left(UnknownFailure());
    }
  }
}
