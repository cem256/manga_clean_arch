import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:manga_clean_arch/app/constants/cache_constants.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/image/jpg/jpg_entity.dart';

part 'image_entity.g.dart';

@HiveType(typeId: CacheConstants.imageEntityTypeId)
class ImageEntity extends HiveObject with EquatableMixin {
  ImageEntity({required this.jpg});

  factory ImageEntity.initial() => ImageEntity(jpg: JpgEntity.initial());

  @HiveField(0)
  final JpgEntity jpg;

  @override
  List<Object?> get props => [jpg];
}
