import 'package:equatable/equatable.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/image/jpg/jpg_entity.dart';

class ImageEntity extends Equatable {
  const ImageEntity({required this.jpg});

  factory ImageEntity.initial() => ImageEntity(jpg: JpgEntity.initial());

  final JpgEntity jpg;

  @override
  List<Object?> get props => [jpg];
}
