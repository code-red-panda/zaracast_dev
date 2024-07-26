import 'package:flutter/material.dart';
import 'package:zaracast/src/core/themes/material_theme.dart';

class IronManMaterialTheme extends BaseMaterialTheme {
  const IronManMaterialTheme(super.textTheme);

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
      primary: Color(0xff904a45),
      surfaceTint: Color(0xff904a45),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdad6),
      onPrimaryContainer: Color(0xff3b0908),
      secondary: Color(0xff0c6780),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffbaeaff),
      onSecondaryContainer: Color(0xff001f29),
      tertiary: Color(0xff6c5e10),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xfff6e388),
      onTertiaryContainer: Color(0xff211b00),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff231918),
      onSurfaceVariant: Color(0xff534342),
      outline: Color(0xff857371),
      outlineVariant: Color(0xffd8c2bf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff392e2d),
      inversePrimary: Color(0xffffb3ad),
      primaryFixed: Color(0xffffdad6),
      onPrimaryFixed: Color(0xff3b0908),
      primaryFixedDim: Color(0xffffb3ad),
      onPrimaryFixedVariant: Color(0xff73332f),
      secondaryFixed: Color(0xffbaeaff),
      onSecondaryFixed: Color(0xff001f29),
      secondaryFixedDim: Color(0xff89d0ed),
      onSecondaryFixedVariant: Color(0xff004d62),
      tertiaryFixed: Color(0xfff6e388),
      onTertiaryFixed: Color(0xff211b00),
      tertiaryFixedDim: Color(0xffd9c76f),
      onTertiaryFixedVariant: Color(0xff524600),
      surfaceDim: Color(0xffe8d6d4),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ef),
      surfaceContainer: Color(0xfffceae8),
      surfaceContainerHigh: Color(0xfff6e4e2),
      surfaceContainerHighest: Color(0xfff1dedc),
    );
  }

  ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb3ad),
      surfaceTint: Color(0xffffb3ad),
      onPrimary: Color(0xff571e1b),
      primaryContainer: Color(0xff73332f),
      onPrimaryContainer: Color(0xffffdad6),
      secondary: Color(0xff89d0ed),
      onSecondary: Color(0xff003545),
      secondaryContainer: Color(0xff004d62),
      onSecondaryContainer: Color(0xffbaeaff),
      tertiary: Color(0xffd9c76f),
      onTertiary: Color(0xff393000),
      tertiaryContainer: Color(0xff524600),
      onTertiaryContainer: Color(0xfff6e388),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1a1110),
      onSurface: Color(0xfff1dedc),
      onSurfaceVariant: Color(0xffd8c2bf),
      outline: Color(0xffa08c8a),
      outlineVariant: Color(0xff534342),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dedc),
      inversePrimary: Color(0xff904a45),
      primaryFixed: Color(0xffffdad6),
      onPrimaryFixed: Color(0xff3b0908),
      primaryFixedDim: Color(0xffffb3ad),
      onPrimaryFixedVariant: Color(0xff73332f),
      secondaryFixed: Color(0xffbaeaff),
      onSecondaryFixed: Color(0xff001f29),
      secondaryFixedDim: Color(0xff89d0ed),
      onSecondaryFixedVariant: Color(0xff004d62),
      tertiaryFixed: Color(0xfff6e388),
      onTertiaryFixed: Color(0xff211b00),
      tertiaryFixedDim: Color(0xffd9c76f),
      onTertiaryFixedVariant: Color(0xff524600),
      surfaceDim: Color(0xff1a1110),
      surfaceBright: Color(0xff423735),
      surfaceContainerLowest: Color(0xff140c0b),
      surfaceContainerLow: Color(0xff231918),
      surfaceContainer: Color(0xff271d1c),
      surfaceContainerHigh: Color(0xff322827),
      surfaceContainerHighest: Color(0xff3d3231),
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
