import 'package:equatable/equatable.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/image/image_entity.dart';

class MangaEntity extends Equatable {
  const MangaEntity({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
    required this.synopsis,
    required this.background,
  });

  factory MangaEntity.initial() => MangaEntity(
        malId: 0,
        url: '',
        images: ImageEntity.initial(),
        title: '',
        synopsis: '',
        background: '',
      );

  final int malId;
  final String url;
  final ImageEntity images;
  final String title;
  final String synopsis;
  final String background;

  @override
  List<Object?> get props => [malId, url, images, title, synopsis, background];
}
