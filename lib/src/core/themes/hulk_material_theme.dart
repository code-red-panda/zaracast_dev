import 'package:flutter/material.dart';
import 'package:zaracast/src/core/themes/material_theme.dart';

class HulkMaterialTheme extends BaseMaterialTheme {
  const HulkMaterialTheme(super.textTheme);

  @override
  ThemeData light() {
    return theme(lightScheme());
  }

  @override
  ThemeData dark() {
    return theme(darkScheme());
  }

  ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4e6629),
      surfaceTint: Color(0xff4e6629),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffcfeda1),
      onPrimaryContainer: Color(0xff121f00),
      secondary: Color(0xff745186),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfff5d9ff),
      onSecondaryContainer: Color(0xff2c0b3e),
      tertiary: Color(0xff4a672d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffcbeea6),
      onTertiaryContainer: Color(0xff0e2000),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffafaee),
      onSurface: Color(0xff1a1c16),
      onSurfaceVariant: Color(0xff45483d),
      outline: Color(0xff75786c),
      outlineVariant: Color(0xffc5c8b9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f312a),
      inversePrimary: Color(0xffb4d088),
      primaryFixed: Color(0xffcfeda1),
      onPrimaryFixed: Color(0xff121f00),
      primaryFixedDim: Color(0xffb4d088),
      onPrimaryFixedVariant: Color(0xff374d14),
      secondaryFixed: Color(0xfff5d9ff),
      onSecondaryFixed: Color(0xff2c0b3e),
      secondaryFixedDim: Color(0xffe2b7f5),
      onSecondaryFixedVariant: Color(0xff5b396d),
      tertiaryFixed: Color(0xffcbeea6),
      onTertiaryFixed: Color(0xff0e2000),
      tertiaryFixedDim: Color(0xffafd18c),
      onTertiaryFixedVariant: Color(0xff334e18),
      surfaceDim: Color(0xffdadbd0),
      surfaceBright: Color(0xfffafaee),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f4e9),
      surfaceContainer: Color(0xffeeefe3),
      surfaceContainerHigh: Color(0xffe8e9de),
      surfaceContainerHighest: Color(0xffe2e3d8),
    );
  }

  ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb4d088),
      surfaceTint: Color(0xffb4d088),
      onPrimary: Color(0xff223600),
      primaryContainer: Color(0xff374d14),
      onPrimaryContainer: Color(0xffcfeda1),
      secondary: Color(0xffe2b7f5),
      onSecondary: Color(0xff432255),
      secondaryContainer: Color(0xff5b396d),
      onSecondaryContainer: Color(0xfff5d9ff),
      tertiary: Color(0xffafd18c),
      onTertiary: Color(0xff1d3703),
      tertiaryContainer: Color(0xff334e18),
      onTertiaryContainer: Color(0xffcbeea6),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff12140e),
      onSurface: Color(0xffe2e3d8),
      onSurfaceVariant: Color(0xffc5c8b9),
      outline: Color(0xff8f9285),
      outlineVariant: Color(0xff45483d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e3d8),
      inversePrimary: Color(0xff4e6629),
      primaryFixed: Color(0xffcfeda1),
      onPrimaryFixed: Color(0xff121f00),
      primaryFixedDim: Color(0xffb4d088),
      onPrimaryFixedVariant: Color(0xff374d14),
      secondaryFixed: Color(0xfff5d9ff),
      onSecondaryFixed: Color(0xff2c0b3e),
      secondaryFixedDim: Color(0xffe2b7f5),
      onSecondaryFixedVariant: Color(0xff5b396d),
      tertiaryFixed: Color(0xffcbeea6),
      onTertiaryFixed: Color(0xff0e2000),
      tertiaryFixedDim: Color(0xffafd18c),
      onTertiaryFixedVariant: Color(0xff334e18),
      surfaceDim: Color(0xff12140e),
      surfaceBright: Color(0xff383a32),
      surfaceContainerLowest: Color(0xff0d0f09),
      surfaceContainerLow: Color(0xff1a1c16),
      surfaceContainer: Color(0xff1e2019),
      surfaceContainerHigh: Color(0xff292b23),
      surfaceContainerHighest: Color(0xff33362e),
    );
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );
}
