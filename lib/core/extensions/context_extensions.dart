import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;

  double get lowValue => height * 0.01;
  double get defaultValue => height * 0.02;
  double get highValue => height * 0.05;
  double get veryhighValue1x => height * 0.1;
  double get veryhighValue2x => height * 0.2;
  double get veryhighValue3x => height * 0.3;
  double get veryhighValue4x => height * 0.4;
  double get veryhighValue5x => height * 0.5;

  double dynamicWidth(double val) => width * val;
  double dynamicHeight(double val) => height * val;
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingAllLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingAllDefault => EdgeInsets.all(defaultValue);
  EdgeInsets get paddingAllHigh => EdgeInsets.all(highValue);
  EdgeInsets get paddingAllVeryHigh => EdgeInsets.all(defaultValue);

  EdgeInsets get paddingHorizontalLow => EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get paddingHorizontalDefault => EdgeInsets.symmetric(horizontal: defaultValue);
  EdgeInsets get paddingHorizontalHigh => EdgeInsets.symmetric(horizontal: highValue);

  EdgeInsets get paddingVerticalLow => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get paddingVerticalDefault => EdgeInsets.symmetric(vertical: defaultValue);
  EdgeInsets get paddingVerticalHigh => EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get paddingRightLow => EdgeInsets.only(right: lowValue);
  EdgeInsets get paddingRightDefault => EdgeInsets.only(right: defaultValue);
  EdgeInsets get paddingRightHigh => EdgeInsets.only(right: highValue);

  EdgeInsets get paddingLeftLow => EdgeInsets.only(left: lowValue);
  EdgeInsets get paddingLeftDefault => EdgeInsets.only(left: defaultValue);
  EdgeInsets get paddingLeftHigh => EdgeInsets.only(left: highValue);

  EdgeInsets get paddingTopLow => EdgeInsets.only(top: lowValue);
  EdgeInsets get paddingTopDefault => EdgeInsets.only(top: defaultValue);
  EdgeInsets get paddingTopHigh => EdgeInsets.only(top: highValue);

  EdgeInsets get paddingBottomLow => EdgeInsets.only(bottom: lowValue);
  EdgeInsets get paddingBottomDefault => EdgeInsets.only(bottom: defaultValue);
  EdgeInsets get paddingBottomHigh => EdgeInsets.only(bottom: highValue);
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  Brightness get brightness => Theme.of(this).brightness;
}
