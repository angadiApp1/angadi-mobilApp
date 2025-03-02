import 'package:flutter/material.dart';

class CustomColors {
  CustomColors._();

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static final Color black80 = black.withAlpha(204);
  static final Color black60 = black.withAlpha(153);
  static final Color black50 = black.withAlpha(128);

  static const Color themeMagenta = Color(0xff5F0F40);
  static const Color grey = Colors.grey;

  static const Color transparent = Colors.transparent;

  // Font
  static const Color neroBlack = Color(0xFF191919);
  static const Color neroBlack2 = Color(0xFF181818);
  static const Color neroBlack3 = Color(0xFF4B4F52);
  static const Color black4 = Color(0xFF1E1E1E);

  // Background
  static const Color pattensBlue = Color(0xFFDBE4F3);

  static const Color warningRed = Color(0xffE8505B);

  // error
  static const Color errorRed = Color(0xFFCC0000);

  // For MaterialColor
  static Color getShade(Color color, {bool darker = false, double value = .1}) {
    assert(value >= 0 && value <= 1, 'shade values must be between 0 and 1');

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness(
      (darker ? (hsl.lightness - value) : (hsl.lightness + value))
          .clamp(0.0, 1.0),
    );

    return hslDark.toColor();
  }
}

extension SuiizColors on Color {
  /// Returns a [MaterialColor] from a [Color] object
  MaterialColor getMaterialColorFromColor() {
    final colorShades = <int, Color>{
      50: CustomColors.getShade(this, value: 0.5),
      100: CustomColors.getShade(this, value: 0.4),
      200: CustomColors.getShade(this, value: 0.3),
      300: CustomColors.getShade(this, value: 0.2),
      400: CustomColors.getShade(this),
      500: this, //Primary value
      600: CustomColors.getShade(this, darker: true),
      700: CustomColors.getShade(this, value: 0.15, darker: true),
      800: CustomColors.getShade(this, value: 0.2, darker: true),
      900: CustomColors.getShade(this, value: 0.25, darker: true),
    };
    return MaterialColor(value, colorShades);
  }
}
