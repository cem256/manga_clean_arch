import 'package:fpdart/fpdart.dart';
import 'package:manga_clean_arch/app/errors/failures/failures.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';

/// [SearchRepository] is a contract class which defines the methods
/// that any implementation of [SearchRepository] must implement.
abstract interface class SearchRepository {
  Future<Either<Failure, List<MangaEntity>>> searchMangas({required String query});
}
