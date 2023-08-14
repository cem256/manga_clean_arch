import 'package:json_annotation/json_annotation.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/genre/genre_entity.dart';

part 'genre_model.g.dart';

@JsonSerializable(createToJson: false)
class GenreModel {
  GenreModel({this.malId, this.name});
  factory GenreModel.fromJson(Map<String, dynamic> data) => _$GenreModelFromJson(data);
  @JsonKey(name: 'mal_id')
  final int? malId;
  final String? name;

  /// Converts [GenreModel] to [GenreEntity]
  GenreEntity toEntity() {
    return GenreEntity(
      malId: malId ?? GenreEntity.initial().malId,
      name: name ?? GenreEntity.initial().name,
    );
  }
}
