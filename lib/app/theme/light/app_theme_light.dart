import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

final class AppThemeLight {
  final ThemeData theme = FlexThemeData.light(
    scheme: FlexScheme.deepPurple,
    surfaceMode: FlexSurfaceMode.level,
    blendLevel: 40,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
  );
}
