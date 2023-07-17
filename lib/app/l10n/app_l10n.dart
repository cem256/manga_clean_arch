import 'package:flutter/material.dart';

/// Contains the information of supported locales, and path to the translation files for the app
abstract final class AppL10n {
  static const path = 'assets/translations';

  static const en = Locale('en', 'US');

  static List<Locale> get supportedLocales => [en];
}
