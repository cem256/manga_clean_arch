import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_clean_arch/app/theme/theme_constants.dart';
import 'package:manga_clean_arch/app/widgets/card/custom_manga_card.dart';
import 'package:manga_clean_arch/app/widgets/error/custom_error_widget.dart';
import 'package:manga_clean_arch/core/extensions/context_extensions.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';
import 'package:manga_clean_arch/feature/search/presentation/bloc/search_bloc.dart';
import 'package:manga_clean_arch/locator.dart';

part '../widgets/search_text_field.dart';
part '../widgets/search_view_success_widget.dart';

@RoutePage()
class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (context) => Locator.instance<SearchBloc>(),
      child: const _SearchViewBody(),
    );
  }
}

class _SearchViewBody extends StatelessWidget {
  const _SearchViewBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _SearchTextField(),
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return switch (state.status) {
            SearchStatus.initial => Center(
                child: Text(
                  'Start Searching for Your Favorite Manga!',
                  style: context.textTheme.bodyLarge,
                ),
              ),
            SearchStatus.loading => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            SearchStatus.noResult => Center(
                child: Text(
                  "No Results Found for '${state.query}'",
                  style: context.textTheme.bodyLarge,
                ),
              ),
            SearchStatus.failure => Center(
                child: CustomErrorWidget(
                  failure: state.failure!,
                  onPressed: () => context.read<SearchBloc>().add(
                        SearchQueryChanged(query: state.query!),
                      ),
                ),
              ),
            SearchStatus.success => _SearchViewSuccessWidget(
                mangas: state.mangas,
              )
          };
        },
      ),
    );
  }
}
