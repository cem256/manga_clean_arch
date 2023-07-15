import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_clean_arch/app/widgets/error/custom_error_widget.dart';
import 'package:manga_clean_arch/core/enums/view_status.dart';
import 'package:manga_clean_arch/feature/popular/presentation/bloc/popular_bloc.dart';
import 'package:manga_clean_arch/feature/popular/presentation/widgets/popular_view_success_widget.dart';
import 'package:manga_clean_arch/service_locator.dart';

@RoutePage()
class PopularView extends StatelessWidget {
  const PopularView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular'),
      ),
      body: BlocProvider<PopularBloc>(
        create: (context) => ServiceLocator.getIt<PopularBloc>()..add(MangasFetched()),
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
          ViewStatus.success => PopularViewSuccessWidget(
              hasReachedMax: state.hasReachedMax,
              mangas: state.mangas,
            ),
        };
      },
    );
  }
}
