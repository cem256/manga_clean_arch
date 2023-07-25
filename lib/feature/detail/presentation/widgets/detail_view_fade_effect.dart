part of '../view/detail_view.dart';

class _DetailViewFadeEffect extends StatelessWidget {
  const _DetailViewFadeEffect();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.veryhighValue4x,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            Colors.transparent,
            context.theme.scaffoldBackgroundColor,
          ],
        ),
      ),
    );
  }
}
