part of '../view/detail_view.dart';

class _DetailViewGenreTags extends StatelessWidget {
  const _DetailViewGenreTags({required this.manga});

  final MangaEntity manga;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: context.lowValue,
      runSpacing: context.lowValue,
      children: [
        ...manga.genres.map(
          (genre) => Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: context.paddingAllLow,
              child: Text(
                genre.name,
              ),
            ),
          ),
        )
      ],
    );
  }
}
