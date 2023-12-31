// ignore_for_file: avoid_field_initializers_in_const_classes

import 'package:flutter/material.dart';
import 'package:manga_clean_arch/app/widgets/card/custom_manga_card.dart';
import 'package:manga_clean_arch/core/extensions/context_extensions.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({required this.mangas, super.key, this.scrollController, this.hasReachedMax});

  final List<MangaEntity> mangas;
  final ScrollController? scrollController;
  final bool? hasReachedMax;

  final int _crossAxisCount = 2;
  final double _childAspectRatio = 3 / 4;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: context.defaultValue,
        crossAxisSpacing: context.defaultValue,
        childAspectRatio: _childAspectRatio,
        crossAxisCount: _crossAxisCount,
      ),
      itemCount: (hasReachedMax ?? true) ? mangas.length : mangas.length + _crossAxisCount,
      itemBuilder: (context, index) {
        return index >= mangas.length
            ? const Center(child: CircularProgressIndicator.adaptive())
            : CustomMangaCard(manga: mangas[index]);
      },
    );
  }
}
