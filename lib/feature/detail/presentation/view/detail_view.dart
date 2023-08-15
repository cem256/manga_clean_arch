import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_clean_arch/app/l10n/app_l10n.g.dart';
import 'package:manga_clean_arch/app/theme/theme_constants.dart';
import 'package:manga_clean_arch/app/widgets/image/custom_network_image.dart';
import 'package:manga_clean_arch/core/extensions/context_extensions.dart';
import 'package:manga_clean_arch/feature/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';

part '../widgets/detail_view_background_image.dart';
part '../widgets/detail_view_fade_effect.dart';
part '../widgets/detail_view_favorites_button.dart';
part '../widgets/detail_view_genre_tags.dart';
part '../widgets/detail_view_left_image.dart';
part '../widgets/detail_view_stats.dart';

@RoutePage()
class DetailView extends StatelessWidget {
  const DetailView({required this.manga, super.key});

  final MangaEntity manga;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                _DetailViewBackgroundImage(
                  manga: manga,
                ),
                const _DetailViewFadeEffect(),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: _DetailViewLeftImage(manga: manga),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: _DetailViewFavoritesButton(manga: manga),
                )
              ],
            ),
            Padding(
              padding: context.paddingAllDefault,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _DetailViewGenreTags(
                    manga: manga,
                  ),
                  SizedBox(
                    height: context.defaultValue,
                  ),
                  _DetailViewStats(
                    manga: manga,
                  ),
                  SizedBox(
                    height: context.defaultValue,
                  ),
                  Text(
                    manga.title,
                    style: context.textTheme.headlineSmall,
                  ),
                  SizedBox(
                    height: context.lowValue,
                  ),
                  Text(
                    manga.synopsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
