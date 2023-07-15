import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';

@RoutePage()
class DetailView extends StatelessWidget {
  const DetailView({required this.manga, super.key});

  final MangaEntity manga;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
    );
  }
}
