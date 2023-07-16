part of '../view/popular_view.dart';

class _PopularViewSuccessWidget extends StatefulWidget {
  const _PopularViewSuccessWidget({required this.mangas, required this.hasReachedMax});

  final List<MangaEntity> mangas;
  final bool hasReachedMax;

  @override
  State<_PopularViewSuccessWidget> createState() => _PopularViewSuccessWidgetState();
}

class _PopularViewSuccessWidgetState extends State<_PopularViewSuccessWidget> {
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
      child: CustomGridView(
        scrollController: _scrollController,
        hasReachedMax: widget.hasReachedMax,
        mangas: widget.mangas,
      ),
    );
  }
}
