import 'package:fpdart/fpdart.dart';

import 'package:manga_clean_arch/app/errors/failures/failures.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';
import 'package:manga_clean_arch/feature/search/domain/repositories/search_repository.dart';

final class UCSearchMangas {
  UCSearchMangas({required SearchRepository repository}) : _repository = repository;

  final SearchRepository _repository;

  Future<Either<Failure, List<MangaEntity>>> call({required String query}) {
    return _repository.searchMangas(query: query);
  }
}
