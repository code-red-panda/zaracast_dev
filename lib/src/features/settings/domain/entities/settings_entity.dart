import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:zaracast/src/core/themes/material_theme_builder.dart';

class SettingsEntity extends Equatable {
  const SettingsEntity({
    required this.userId,
    this.theme = MaterialTheme.ghostSpider,
    this.themeMode = ThemeMode.system,
  });

  final String userId;
  final MaterialTheme theme;
  final ThemeMode themeMode;

  SettingsEntity copyWith({
    String? userId,
    MaterialTheme? theme,
    ThemeMode? themeMode,
  }) {
    return SettingsEntity(
      userId: userId ?? this.userId,
      theme: theme ?? this.theme,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object?> get props => [userId, theme, themeMode];
}
