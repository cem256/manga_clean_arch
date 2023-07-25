part of '../view/detail_view.dart';

class _DetailViewBackgroundImage extends StatelessWidget {
  const _DetailViewBackgroundImage({required this.manga});

  final MangaEntity manga;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.veryhighValue4x,
      width: double.infinity,
      child: CustomNetworkImage(
        imageUrl: manga.images.jpg.imageUrl,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
