import 'package:json_annotation/json_annotation.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/image/jpg/jpg_entity.dart';

part 'jpg_model.g.dart';

@JsonSerializable(createToJson: false)
class JpgModel {
  JpgModel({this.imageUrl});

  factory JpgModel.fromJson(Map<String, dynamic> data) => _$JpgModelFromJson(data);

  @JsonKey(name: 'image_url')
  final String? imageUrl;
}

extension JpgModelX on JpgModel {
  /// Converts [JpgModel] to [JpgEntity]
  JpgEntity toJpgEntity() {
    return JpgEntity(
      imageUrl: imageUrl ?? JpgEntity.initial().imageUrl,
    );
  }
}
