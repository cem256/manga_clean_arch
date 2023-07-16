import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_clean_arch/app/l10n/app_l10n.g.dart';
import 'package:manga_clean_arch/app/theme/theme_constants.dart';
import 'package:manga_clean_arch/app/widgets/error/custom_error_widget.dart';
import 'package:manga_clean_arch/app/widgets/grid/custom_grid_view.dart';
import 'package:manga_clean_arch/core/extensions/context_extensions.dart';
import 'package:manga_clean_arch/feature/search/presentation/bloc/search_bloc.dart';
import 'package:manga_clean_arch/locator.dart';

part '../widgets/search_text_field.dart';

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
                  LocaleKeys.searchView_statusInitial.tr(),
                  style: context.textTheme.bodyLarge,
                ),
              ),
            SearchStatus.loading => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            SearchStatus.noResult => Center(
                child: Text(
                  LocaleKeys.searchView_statusNoResult.tr(args: [state.query!]),
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
            SearchStatus.success => Padding(
                padding: context.paddingAllDefault,
                child: CustomGridView(mangas: state.mangas),
              )
          };
        },
      ),
    );
  }
}
