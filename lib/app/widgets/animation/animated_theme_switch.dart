import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:manga_clean_arch/app/constants/asset_constants.dart';
import 'package:manga_clean_arch/app/constants/duration_constants.dart';
import 'package:manga_clean_arch/app/theme/cubit/theme_cubit.dart';
import 'package:manga_clean_arch/core/extensions/context_extensions.dart';

class AnimatedThemeSwitch extends StatefulWidget {
  const AnimatedThemeSwitch({super.key});

  @override
  State<AnimatedThemeSwitch> createState() => _AnimatedThemeSwitchState();
}

class _AnimatedThemeSwitchState extends State<AnimatedThemeSwitch> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: DurationConstants.veryShort(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.animateTo(
          context.brightness == Brightness.dark ? _SwitchPosition.right.value : _SwitchPosition.left.value,
        );
        context.read<ThemeCubit>().changeTheme(brightness: context.brightness);
      },
      child: Lottie.asset(
        controller: _controller,
        AssetConstants.themeSwitchAnimation,
        onLoaded: (_) => _controller.value =
            context.brightness == Brightness.dark ? _SwitchPosition.left.value : _SwitchPosition.right.value,
        fit: BoxFit.none,
      ),
    );
  }
}

enum _SwitchPosition {
  left(1),
  right(0.5);

  const _SwitchPosition(this.value);
  final double value;
}
