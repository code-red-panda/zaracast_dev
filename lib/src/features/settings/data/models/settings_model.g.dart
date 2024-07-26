// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsModel _$SettingsModelFromJson(Map<String, dynamic> json) =>
    SettingsModel(
      theme: $enumDecode(_$MaterialThemeEnumMap, json['theme']),
      themeMode: $enumDecode(_$ThemeModeEnumMap, json['themeMode']),
    );

Map<String, dynamic> _$SettingsModelToJson(SettingsModel instance) =>
    <String, dynamic>{
      'theme': _$MaterialThemeEnumMap[instance.theme]!,
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
    };

const _$MaterialThemeEnumMap = {
  MaterialTheme.ghostSpider: 'ghostSpider',
  MaterialTheme.ironMan: 'ironMan',
};

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
