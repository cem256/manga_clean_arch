part of '../view/detail_view.dart';

class _DetailViewStats extends StatelessWidget {
  const _DetailViewStats({required this.manga});

  final MangaEntity manga;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _StatTile(
          manga: manga,
          title: LocaleKeys.detailView_rank.tr(),
          subtitle: '#${manga.rank}',
        ),
        _StatTile(
          manga: manga,
          title: LocaleKeys.detailView_rating.tr(),
          subtitle: '${manga.score} / 10',
        ),
        _StatTile(
          manga: manga,
          title: LocaleKeys.detailView_members.tr(),
          subtitle: manga.members.toString(),
        ),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.manga, required this.title, required this.subtitle});

  final MangaEntity manga;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
        ),
        Text(
          subtitle,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
