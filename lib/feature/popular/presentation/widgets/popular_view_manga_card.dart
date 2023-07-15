part of '../view/popular_view.dart';

class _PopularViewMangaCard extends StatelessWidget {
  const _PopularViewMangaCard({required this.manga});

  final MangaEntity manga;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(DetailRoute(manga: manga)),
      child: ClipRRect(
        borderRadius: ThemeConstants.borderRadiusCircular,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              width: double.infinity,
              child: CustomNetworkImage(
                imageUrl: manga.images.jpg.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: context.paddingAllLow,
              height: context.dynamicHeight(0.08),
              color: context.theme.scaffoldBackgroundColor.withOpacity(0.8),
              child: Center(
                child: Text(
                  manga.title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.titleSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
