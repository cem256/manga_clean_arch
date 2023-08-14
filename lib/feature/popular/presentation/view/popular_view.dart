import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_clean_arch/app/l10n/app_l10n.g.dart';
import 'package:manga_clean_arch/app/router/app_router.gr.dart';
import 'package:manga_clean_arch/app/widgets/animation/animated_theme_switch.dart';
import 'package:manga_clean_arch/app/widgets/error/custom_error_widget.dart';
import 'package:manga_clean_arch/app/widgets/grid/custom_grid_view.dart';
import 'package:manga_clean_arch/core/enums/view_status.dart';
import 'package:manga_clean_arch/core/extensions/context_extensions.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';
import 'package:manga_clean_arch/feature/popular/presentation/bloc/popular_bloc.dart';
import 'package:manga_clean_arch/locator.dart';

part '../widgets/popular_view_appbar.dart';
part '../widgets/popular_view_success_widget.dart';

@RoutePage()
class PopularView extends StatelessWidget {
  const PopularView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _PopularViewAppBar(),
      body: BlocProvider<PopularBloc>(
        create: (context) => Locator.instance<PopularBloc>()..add(MangasFetched()),
        child: const PopularViewBody(),
      ),
    );
  }
}

class PopularViewBody extends StatelessWidget {
  const PopularViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularBloc, PopularState>(
      builder: (context, state) {
        return switch (state.status) {
          ViewStatus.loading => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ViewStatus.failure => Center(
              child: CustomErrorWidget(
                failure: state.failure!,
                onPressed: () => context.read<PopularBloc>().add(
                      MangasFetched(),
                    ),
              ),
            ),
          ViewStatus.success => _PopularViewSuccessWidget(
              hasReachedMax: state.hasReachedMax,
              mangas: state.mangas,
            ),
        };
      },
    );
  }
}
