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
        _controller.animateTo(context.brightness == Brightness.dark ? 0.5 : 1);
        context.read<ThemeCubit>().changeTheme(brightness: context.brightness);
      },
      child: Lottie.asset(
        fit: BoxFit.none,
        AssetConstants.themeSwitchAnimation,
        controller: _controller,
        onLoaded: (_) => _controller.value = context.brightness == Brightness.dark ? 1 : 0.5,
      ),
    );
  }
}
