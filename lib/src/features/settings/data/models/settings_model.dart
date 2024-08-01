import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:zaracast/src/core/themes/material_theme_builder.dart';
import 'package:zaracast/src/features/settings/domain/entities/settings_entity.dart';

part 'settings_model.g.dart';

@JsonSerializable()
class SettingsModel extends SettingsEntity {
  const SettingsModel({
    required super.userId,
    required super.theme,
    required super.themeMode,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsModelToJson(this);
}
