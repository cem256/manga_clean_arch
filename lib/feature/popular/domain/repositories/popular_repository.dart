import 'package:fpdart/fpdart.dart';
import 'package:manga_clean_arch/app/errors/failures/failures.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';

/// [PopularRepository] is a contract class which defines the methods
/// that any implementation of [PopularRepository] must implement.
abstract interface class PopularRepository {
  Future<Either<Failure, List<MangaEntity>>> getPopularMangas({required int page, required int limit});
}
