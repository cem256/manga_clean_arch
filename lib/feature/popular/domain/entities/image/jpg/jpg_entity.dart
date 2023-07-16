import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:manga_clean_arch/app/constants/cache_constants.dart';

part 'jpg_entity.g.dart';

@HiveType(typeId: CacheConstants.jpgEntityTypeId)
class JpgEntity extends HiveObject with EquatableMixin {
  JpgEntity({required this.imageUrl});

  factory JpgEntity.initial() => JpgEntity(imageUrl: '');

  @HiveField(0)
  final String imageUrl;

  @override
  List<Object?> get props => [imageUrl];
}
