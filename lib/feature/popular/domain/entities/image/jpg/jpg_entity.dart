import 'package:equatable/equatable.dart';

class JpgEntity extends Equatable {
  const JpgEntity({required this.imageUrl});

  factory JpgEntity.initial() => const JpgEntity(imageUrl: '');

  final String imageUrl;

  @override
  List<Object?> get props => [imageUrl];
}
