import 'package:json_annotation/json_annotation.dart';
import 'package:manga_clean_arch/feature/popular/data/models/image/jpg/jpg_model.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/image/image_entity.dart';

part 'image_model.g.dart';

@JsonSerializable(createToJson: false)
class ImageModel {
  ImageModel({this.jpg});
  factory ImageModel.fromJson(Map<String, dynamic> data) => _$ImageModelFromJson(data);

  final JpgModel? jpg;
}

extension ImageModelX on ImageModel {
  /// Converts [ImageModel] to [ImageEntity]
  ImageEntity toImageEntity() {
    return ImageEntity(
      jpg: jpg?.toJpgEntity() ?? ImageEntity.initial().jpg,
    );
  }
}
