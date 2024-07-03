import 'package:flutter/material.dart';

class Themes {
  static ThemeData lightTheme() {
    return ThemeData.light(useMaterial3: true).copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: ThemeColors.m3Baseline,
        brightness: Brightness.light
      )
    );
  }
  
  static ThemeData darkTheme() {
    return ThemeData.dark(useMaterial3: true).copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: ThemeColors.m3Baseline,
        brightness: Brightness.dark
      )
    );
  }
}

class ThemeColors {
  static const Color m3Baseline = Color(0xffff3333);
  static const Color locationPin = Colors.lightGreenAccent;
}

class ThemeSpacer {
  static SizedBox get SmallY => const SizedBox(height: 8.0);
  static SizedBox get MediumY => const SizedBox(height: 16.0);
  static SizedBox get LargeY => const SizedBox(height: 24.0);
  static SizedBox get ExtraLargeY => const SizedBox(height: 32.0);

  static SizedBox get SmallX => const SizedBox(width: 8.0);
  static SizedBox get MediumX => const SizedBox(width: 16.0);
  static SizedBox get LargeX => const SizedBox(width: 24.0);
  static SizedBox get ExtraLargeX => const SizedBox(width: 32.0);

  static SizedBox get SmallXY => const SizedBox(width: 8.0, height: 8.0);
  static SizedBox get MediumXY => const SizedBox(width: 16.0, height: 16.0);
  static SizedBox get LargeXY => const SizedBox(width: 24.0, height: 24.0);
  static SizedBox get ExtraLargeXY => const SizedBox(width: 32.0, height: 32.0);
}