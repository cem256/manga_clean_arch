import 'package:dartz/dartz.dart';
import 'package:manga_clean_arch/app/errors/failures/failures.dart';
import 'package:manga_clean_arch/feature/favorites/domain/repositories/favorites_repository.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';

class UCGetFavorites {
  UCGetFavorites({required FavoritesRepository repository}) : _repository = repository;

  final FavoritesRepository _repository;

  Either<Failure, List<MangaEntity>> call() {
    return _repository.getFavorites();
  }
}
