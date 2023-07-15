import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_clean_arch/core/extensions/context_extensions.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';
import 'package:manga_clean_arch/feature/popular/presentation/bloc/popular_bloc.dart';
import 'package:manga_clean_arch/feature/popular/presentation/widgets/manga_card.dart';

class PopularViewSuccessWidget extends StatefulWidget {
  const PopularViewSuccessWidget({required this.mangas, required this.hasReachedMax, super.key});

  final List<MangaEntity> mangas;
  final bool hasReachedMax;

  @override
  State<PopularViewSuccessWidget> createState() => _PopularViewSuccessWidgetState();
}

class _PopularViewSuccessWidgetState extends State<PopularViewSuccessWidget> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_scrollListener)
      ..dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      context.read<PopularBloc>().add(MangasFetched());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllDefault,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: context.defaultValue,
              crossAxisSpacing: context.defaultValue,
              childAspectRatio: 3 / 4,
              crossAxisCount: 2,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => MangaCard(
                manga: widget.mangas[index],
              ),
              childCount: widget.mangas.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: context.defaultValue,
                ),
                const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
