// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsModel _$SettingsModelFromJson(Map<String, dynamic> json) =>
    SettingsModel(
      userId: json['userId'] as String,
      theme: $enumDecodeNullable(_$MaterialThemeEnumMap, json['theme']) ??
          MaterialTheme.ghostSpider,
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
          ThemeMode.system,
    );

Map<String, dynamic> _$SettingsModelToJson(SettingsModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'theme': _$MaterialThemeEnumMap[instance.theme],
      'themeMode': _$ThemeModeEnumMap[instance.themeMode],
    };

const _$MaterialThemeEnumMap = {
  MaterialTheme.ghostSpider: 'ghostSpider',
  MaterialTheme.ironMan: 'ironMan',
  MaterialTheme.hulk: 'hulk',
};

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
