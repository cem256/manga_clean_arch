import 'package:dartz/dartz.dart';
import 'package:manga_clean_arch/app/errors/failures/failures.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';
import 'package:manga_clean_arch/feature/popular/domain/repositories/popular_repository.dart';

class UCGetPopularMangas {
  UCGetPopularMangas({required PopularRepository repository}) : _repository = repository;

  final PopularRepository _repository;

  Future<Either<Failure, List<MangaEntity>>> call({required int page, required int limit}) {
    return _repository.getPopularMangas(page: page, limit: limit);
  }
}
