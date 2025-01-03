import 'package:flutter/material.dart';

class AltTextStyle {
  static TextTheme get textTheme => const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'PretendardVariable',
          fontVariations: [FontVariation('wght', 700)],
          fontSize: 57,
          height: 1.12,
        ),
        displayMedium: TextStyle(
          fontFamily: 'PretendardVariable',
          fontVariations: [FontVariation('wght', 700)],
          fontSize: 45,
          height: 1.16,
        ),
        displaySmall: TextStyle(
          fontFamily: 'PretendardVariable',
          fontVariations: [FontVariation('wght', 700)],
          fontSize: 36,
          height: 1.22,
        ),
        headlineLarge: TextStyle(
          fontFamily: 'PretendardVariable',
          fontVariations: [FontVariation('wght', 600)],
          fontSize: 32,
          height: 1.25,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'PretendardVariable',
          fontVariations: [FontVariation('wght', 600)],
          fontSize: 28,
          height: 1.29,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'PretendardVariable',
          fontVariations: [FontVariation('wght', 600)],
          fontSize: 24,
          height: 1.33,
        ),
        titleLarge: TextStyle(
          fontFamily: 'PretendardVariable',
          fontVariations: [FontVariation('wght', 500)],
          fontSize: 22,
          height: 1.27,
        ),
        titleMedium: TextStyle(
          fontFamily: 'PretendardVariable',
          fontVariations: [FontVariation('wght', 500)],
          fontSize: 16,
          height: 1.5,
          letterSpacing: 0.15,
        ),
        titleSmall: TextStyle(
          fontFamily: 'PretendardVariable',
          fontVariations: [FontVariation('wght', 500)],
          fontSize: 14,
          height: 1.43,
          letterSpacing: 0.1,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'PretendardVariable',
          fontVariations: [FontVariation('wght', 400)],
          fontSize: 16,
          height: 1.5,
          letterSpacing: 0.15,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'PretendardVariable',
          fontVariations: [FontVariation('wght', 400)],
          fontSize: 14,
          height: 1.43,
          letterSpacing: 0.25,
        ),
        bodySmall: TextStyle(
          fontFamily: 'PretendardVariable',
          fontVariations: [FontVariation('wght', 400)],
          fontSize: 12,
          height: 1.33,
          letterSpacing: 0.4,
        ),
        labelLarge: TextStyle(
          fontFamily: 'PretendardVariable',
          fontVariations: [FontVariation('wght', 500)],
          fontSize: 14,
          height: 1.43,
          letterSpacing: 0.1,
        ),
        labelMedium: TextStyle(
          fontFamily: 'PretendardVariable',
          fontVariations: [FontVariation('wght', 500)],
          fontSize: 12,
          height: 1.33,
          letterSpacing: 0.5,
        ),
        labelSmall: TextStyle(
          fontFamily: 'PretendardVariable',
          fontVariations: [FontVariation('wght', 500)],
          fontSize: 11,
          height: 1.45,
          letterSpacing: 0.5,
        ),
      );
}
