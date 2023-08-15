import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:manga_clean_arch/app/constants/cache_constants.dart';

part 'genre_entity.g.dart';

@HiveType(typeId: CacheConstants.genreEntityTypeId)
class GenreEntity extends HiveObject with EquatableMixin {
  GenreEntity({
    required this.malId,
    required this.name,
  });

  factory GenreEntity.initial() => GenreEntity(
        malId: 0,
        name: '',
      );

  @HiveField(0)
  final int malId;
  @HiveField(1)
  final String name;

  @override
  List<Object?> get props => [malId, name];
}
