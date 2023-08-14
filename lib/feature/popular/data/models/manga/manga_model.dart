import 'package:json_annotation/json_annotation.dart';
import 'package:manga_clean_arch/feature/popular/data/models/genre/genre_model.dart';
import 'package:manga_clean_arch/feature/popular/data/models/image/image_model.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';

part 'manga_model.g.dart';

@JsonSerializable(createToJson: false)
class MangaModel {
  MangaModel({
    this.malId,
    this.url,
    this.images,
    this.title,
    this.synopsis,
    this.rank,
    this.score,
    this.members,
    this.genres,
  });

  factory MangaModel.fromJson(Map<String, dynamic> data) => _$MangaModelFromJson(data);

  @JsonKey(name: 'mal_id')
  final int? malId;
  final String? url;
  final ImageModel? images;
  final String? title;
  final String? synopsis;
  final int? rank;
  final double? score;
  final int? members;
  final List<GenreModel>? genres;

  /// Converts [MangaModel] to [MangaEntity]
  MangaEntity toEntity() {
    return MangaEntity(
      malId: malId ?? MangaEntity.initial().malId,
      url: url ?? MangaEntity.initial().url,
      images: images?.toEntity() ?? MangaEntity.initial().images,
      title: title ?? MangaEntity.initial().title,
      synopsis: synopsis ?? MangaEntity.initial().synopsis,
      rank: rank ?? MangaEntity.initial().rank,
      score: score ?? MangaEntity.initial().score,
      members: members ?? MangaEntity.initial().members,
      genres: genres?.map((element) => element.toEntity()).toList() ?? MangaEntity.initial().genres,
    );
  }
}
