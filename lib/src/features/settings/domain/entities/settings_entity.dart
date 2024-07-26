import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:zaracast/src/core/themes/material_theme.dart';

class SettingsEntity extends Equatable {
  const SettingsEntity({required this.theme, required this.themeMode});

  final MaterialTheme theme;
  final ThemeMode themeMode;

  @override
  List<Object?> get props => [themeMode];
}
