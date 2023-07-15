import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:manga_clean_arch/app/router/app_router.gr.dart';
import 'package:manga_clean_arch/app/theme/theme_constants.dart';
import 'package:manga_clean_arch/app/widgets/image/custom_network_image.dart';
import 'package:manga_clean_arch/core/extensions/context_extensions.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';

class CustomMangaCard extends StatelessWidget {
  const CustomMangaCard({required this.manga, super.key});

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
