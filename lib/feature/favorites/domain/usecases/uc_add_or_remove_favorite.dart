import 'package:fpdart/fpdart.dart';
import 'package:manga_clean_arch/app/errors/failures/failures.dart';
import 'package:manga_clean_arch/feature/favorites/domain/repositories/favorites_repository.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';

final class UCAddOrRemoveFavorite {
  UCAddOrRemoveFavorite({required FavoritesRepository repository}) : _repository = repository;

  final FavoritesRepository _repository;

  Future<Either<Failure, List<MangaEntity>>> call(MangaEntity item) async {
    return _repository.addOrRemoveItem(item);
  }
}
