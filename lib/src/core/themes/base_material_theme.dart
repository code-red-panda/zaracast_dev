import 'package:flutter/material.dart';
import 'package:zaracast/src/core/themes/ghost_spider_material_theme.dart';

/// Base class for material themes.
/// 
/// First, export a Flutter Material Theme using the Material Theme Builder 
/// webstite: https://material-foundation.github.io/material-theme-builder/
/// 
/// Then rename, modify, and extend the generated theme to create an expected
/// custom theme for this app. See [GhostSpiderMaterialTheme] as an example.
abstract class BaseMaterialTheme {
  const BaseMaterialTheme(this.textTheme);

  final TextTheme textTheme;

  ThemeData light();

  ThemeData dark();
}
