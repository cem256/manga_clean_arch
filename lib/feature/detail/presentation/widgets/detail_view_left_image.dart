part of '../view/detail_view.dart';

class _DetailViewLeftImage extends StatelessWidget {
  const _DetailViewLeftImage({required this.manga});

  final MangaEntity manga;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllDefault,
      child: SizedBox(
        height: context.veryhighValue2x,
        child: ClipRRect(
          borderRadius: ThemeConstants.borderRadiusCircular,
          child: CustomNetworkImage(
            imageUrl: manga.images.jpg.imageUrl,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
