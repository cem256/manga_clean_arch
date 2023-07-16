import 'package:flutter/material.dart';

abstract final class AppL10n {
  static const path = 'assets/translations';

  static const en = Locale('en', 'US');

  static List<Locale> get supportedLocales => [en];
}
