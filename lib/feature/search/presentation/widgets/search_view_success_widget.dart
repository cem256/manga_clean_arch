part of '../view/search_view.dart';

class _SearchViewSuccessWidget extends StatelessWidget {
  const _SearchViewSuccessWidget({required this.mangas});

  final List<MangaEntity> mangas;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllDefault,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: context.defaultValue,
          crossAxisSpacing: context.defaultValue,
          childAspectRatio: 3 / 4,
          crossAxisCount: 2,
        ),
        itemCount: mangas.length,
        itemBuilder: (context, index) => CustomMangaCard(
          manga: mangas[index],
        ),
      ),
    );
  }
}
