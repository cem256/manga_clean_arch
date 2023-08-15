part of '../view/detail_view.dart';

class _DetailViewFavoritesButton extends StatelessWidget {
  const _DetailViewFavoritesButton({required this.manga});

  final MangaEntity manga;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllDefault,
      child: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          return IconButton(
            onPressed: () => context.read<FavoritesBloc>().add(FavoriteButtonTapped(manga)),
            icon: Icon(
              Icons.star_rate_rounded,
              size: context.highValue,
              color: state.mangas.any((favorite) => favorite.malId == manga.malId)
                  ? context.theme.colorScheme.primary
                  : context.theme.colorScheme.outline,
            ),
          );
        },
      ),
    );
  }
}
