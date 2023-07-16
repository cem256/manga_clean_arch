import 'package:dartz/dartz.dart';
import 'package:manga_clean_arch/app/errors/failures/failures.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';

abstract interface class FavoritesRepository {
  Either<Failure, List<MangaEntity>> getFavorites();
  Future<Either<Failure, List<MangaEntity>>> addOrRemoveItem(MangaEntity item);
}
