import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/image/jpg/jpg_entity.dart';

part 'jpg_model.g.dart';

@JsonSerializable(createToJson: false)
class JpgModel extends Equatable {
  const JpgModel({this.imageUrl});

  factory JpgModel.fromJson(Map<String, dynamic> data) => _$JpgModelFromJson(data);

  @JsonKey(name: 'image_url')
  final String? imageUrl;

  /// Converts [JpgModel] to [JpgEntity]
  JpgEntity toEntity() {
    return JpgEntity(
      imageUrl: imageUrl ?? JpgEntity.initial().imageUrl,
    );
  }

  @override
  List<Object?> get props => [imageUrl];
}
