import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:manga_clean_arch/app/constants/cache_constants.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/genre/genre_entity.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/image/image_entity.dart';

part 'manga_entity.g.dart';

@HiveType(typeId: CacheConstants.mangaEntityTypeId)
class MangaEntity extends HiveObject with EquatableMixin {
  MangaEntity({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
    required this.synopsis,
    required this.rank,
    required this.score,
    required this.members,
    required this.genres,
  });

  factory MangaEntity.initial() => MangaEntity(
        malId: 0,
        url: '',
        images: ImageEntity.initial(),
        title: '',
        synopsis: '',
        rank: 0,
        score: 0,
        members: 0,
        genres: [],
      );

  @HiveField(0)
  final int malId;
  @HiveField(1)
  final String url;
  @HiveField(2)
  final ImageEntity images;
  @HiveField(3)
  final String title;
  @HiveField(4)
  final String synopsis;
  @HiveField(5)
  final int rank;
  @HiveField(6)
  final double score;
  @HiveField(7)
  final int members;
  @HiveField(8)
  final List<GenreEntity> genres;

  @override
  List<Object?> get props => [malId, url, images, title, synopsis, rank, score, members, genres];
}
