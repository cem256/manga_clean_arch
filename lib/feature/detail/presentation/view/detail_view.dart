import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_clean_arch/app/theme/theme_constants.dart';
import 'package:manga_clean_arch/app/widgets/image/custom_network_image.dart';
import 'package:manga_clean_arch/core/extensions/context_extensions.dart';
import 'package:manga_clean_arch/feature/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';

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
                SizedBox(
                  height: context.veryhighValue4x,
                  width: double.infinity,
                  child: CustomNetworkImage(imageUrl: manga.images.jpg.imageUrl, fit: BoxFit.fitWidth),
                ),
                Container(
                  height: context.veryhighValue4x,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.transparent,
                        context.theme.scaffoldBackgroundColor,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Padding(
                    padding: context.paddingAllDefault,
                    child: SizedBox(
                      height: context.veryhighValue2x,
                      child: ClipRRect(
                        borderRadius: ThemeConstants.borderRadiusCircular,
                        child: CustomNetworkImage(
                          imageUrl: manga.images.jpg.imageUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: context.paddingAllDefault,
                    child: BlocBuilder<FavoritesBloc, FavoritesState>(
                      builder: (context, state) {
                        return IconButton(
                          onPressed: () => context.read<FavoritesBloc>().add(FavoriteButtonTapped(manga)),
                          icon: Icon(
                            Icons.favorite,
                            size: context.highValue,
                            color: state.mangas.any((favorite) => favorite.malId == manga.malId)
                                ? context.theme.colorScheme.error
                                : context.theme.colorScheme.outline,
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: context.defaultValue,
            ),
            Padding(
              padding: context.paddingAllDefault,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    manga.title,
                    style: context.textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: context.defaultValue,
                  ),
                  Text(
                    manga.synopsis,
                    style: context.textTheme.bodyLarge,
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
