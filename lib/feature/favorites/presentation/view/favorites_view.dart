import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_clean_arch/app/widgets/card/custom_manga_card.dart';
import 'package:manga_clean_arch/app/widgets/error/custom_error_widget.dart';
import 'package:manga_clean_arch/core/extensions/context_extensions.dart';
import 'package:manga_clean_arch/feature/favorites/presentation/bloc/favorites_bloc.dart';

@RoutePage()
class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          return switch (state.status) {
            FavoritesStatus.loading => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            FavoritesStatus.empty => Center(
                child: Text(
                  "You Don't Have Any Favorites Yet",
                  style: context.textTheme.bodyLarge,
                ),
              ),
            FavoritesStatus.failure => Center(
                child: CustomErrorWidget(
                  failure: state.failure!,
                  onPressed: () => context.read<FavoritesBloc>().add(
                        const FavoritesFetched(),
                      ),
                ),
              ),
            FavoritesStatus.success => Padding(
                padding: context.paddingAllDefault,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: context.defaultValue,
                    crossAxisSpacing: context.defaultValue,
                    childAspectRatio: 3 / 4,
                    crossAxisCount: 2,
                  ),
                  itemCount: state.mangas.length,
                  itemBuilder: (context, index) => CustomMangaCard(
                    manga: state.mangas[index],
                  ),
                ),
              )
          };
        },
      ),
    );
  }
}
