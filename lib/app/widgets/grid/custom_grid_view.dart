import 'package:flutter/material.dart';
import 'package:manga_clean_arch/app/widgets/card/custom_manga_card.dart';
import 'package:manga_clean_arch/core/extensions/context_extensions.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({required this.mangas, super.key, this.scrollController, this.hasReachedMax});

  final List<MangaEntity> mangas;
  final ScrollController? scrollController;
  final bool? hasReachedMax;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: context.defaultValue,
        crossAxisSpacing: context.defaultValue,
        childAspectRatio: 3 / 4,
        crossAxisCount: 2,
      ),
      itemCount: (hasReachedMax ?? true) ? mangas.length : mangas.length + 2,
      itemBuilder: (context, index) {
        return index >= mangas.length
            ? const CircularProgressIndicator.adaptive()
            : CustomMangaCard(manga: mangas[index]);
      },
    );
  }
}
