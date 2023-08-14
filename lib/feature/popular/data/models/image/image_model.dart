import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:manga_clean_arch/feature/popular/data/models/image/jpg/jpg_model.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/image/image_entity.dart';

part 'image_model.g.dart';

@JsonSerializable(createToJson: false)
class ImageModel extends Equatable {
  const ImageModel({this.jpg});
  factory ImageModel.fromJson(Map<String, dynamic> data) => _$ImageModelFromJson(data);

  final JpgModel? jpg;

  /// Converts [ImageModel] to [ImageEntity]
  ImageEntity toEntity() {
    return ImageEntity(
      jpg: jpg?.toEntity() ?? ImageEntity.initial().jpg,
    );
  }

  @override
  List<Object?> get props => [jpg];
}
