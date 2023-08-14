part of '../view/detail_view.dart';

class _DetailViewMangaSynopsis extends StatelessWidget {
  const _DetailViewMangaSynopsis({required this.manga});

  final MangaEntity manga;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllDefault,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            manga.title,
            style: context.textTheme.headlineMedium,
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
    );
  }
}
