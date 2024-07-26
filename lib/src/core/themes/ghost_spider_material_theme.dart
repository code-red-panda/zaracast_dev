import 'package:flutter/material.dart';
import 'package:zaracast/src/core/themes/material_theme.dart';

class GhostSpiderMaterialTheme extends BaseMaterialTheme {
  const GhostSpiderMaterialTheme(super.textTheme);

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
      primary: Color(0xff735187),
      surfaceTint: Color(0xff735187),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xfff4d9ff),
      onPrimaryContainer: Color(0xff2b0b3f),
      secondary: Color(0xff8b4a62),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffd9e3),
      onSecondaryContainer: Color(0xff39071f),
      tertiary: Color(0xff006a6a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff9cf1f0),
      onTertiaryContainer: Color(0xff002020),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffff7fc),
      onSurface: Color(0xff1e1a20),
      onSurfaceVariant: Color(0xff4b454d),
      outline: Color(0xff7d747e),
      outlineVariant: Color(0xffcec3ce),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff332f35),
      inversePrimary: Color(0xffe0b8f5),
      primaryFixed: Color(0xfff4d9ff),
      onPrimaryFixed: Color(0xff2b0b3f),
      primaryFixedDim: Color(0xffe0b8f5),
      onPrimaryFixedVariant: Color(0xff5a396e),
      secondaryFixed: Color(0xffffd9e3),
      onSecondaryFixed: Color(0xff39071f),
      secondaryFixedDim: Color(0xffffb0cb),
      onSecondaryFixedVariant: Color(0xff6f334b),
      tertiaryFixed: Color(0xff9cf1f0),
      onTertiaryFixed: Color(0xff002020),
      tertiaryFixedDim: Color(0xff80d5d4),
      onTertiaryFixedVariant: Color(0xff004f50),
      surfaceDim: Color(0xffe0d7df),
      surfaceBright: Color(0xfffff7fc),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffaf1f9),
      surfaceContainer: Color(0xfff4ebf3),
      surfaceContainerHigh: Color(0xffefe5ed),
      surfaceContainerHighest: Color(0xffe9e0e7),
    );
  }

  ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe0b8f5),
      surfaceTint: Color(0xffe0b8f5),
      onPrimary: Color(0xff422255),
      primaryContainer: Color(0xff5a396e),
      onPrimaryContainer: Color(0xfff4d9ff),
      secondary: Color(0xffffb0cb),
      onSecondary: Color(0xff541d34),
      secondaryContainer: Color(0xff6f334b),
      onSecondaryContainer: Color(0xffffd9e3),
      tertiary: Color(0xff80d5d4),
      onTertiary: Color(0xff003737),
      tertiaryContainer: Color(0xff004f50),
      onTertiaryContainer: Color(0xff9cf1f0),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff161217),
      onSurface: Color(0xffe9e0e7),
      onSurfaceVariant: Color(0xffcec3ce),
      outline: Color(0xff978e98),
      outlineVariant: Color(0xff4b454d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe9e0e7),
      inversePrimary: Color(0xff735187),
      primaryFixed: Color(0xfff4d9ff),
      onPrimaryFixed: Color(0xff2b0b3f),
      primaryFixedDim: Color(0xffe0b8f5),
      onPrimaryFixedVariant: Color(0xff5a396e),
      secondaryFixed: Color(0xffffd9e3),
      onSecondaryFixed: Color(0xff39071f),
      secondaryFixedDim: Color(0xffffb0cb),
      onSecondaryFixedVariant: Color(0xff6f334b),
      tertiaryFixed: Color(0xff9cf1f0),
      onTertiaryFixed: Color(0xff002020),
      tertiaryFixedDim: Color(0xff80d5d4),
      onTertiaryFixedVariant: Color(0xff004f50),
      surfaceDim: Color(0xff161217),
      surfaceBright: Color(0xff3c383d),
      surfaceContainerLowest: Color(0xff100d12),
      surfaceContainerLow: Color(0xff1e1a20),
      surfaceContainer: Color(0xff221e24),
      surfaceContainerHigh: Color(0xff2d282e),
      surfaceContainerHighest: Color(0xff383339),
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
