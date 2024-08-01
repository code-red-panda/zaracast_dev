import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:zaracast/src/core/utils/drift/app_database.dart';
import 'package:zaracast/src/features/settings/data/models/settings_model.dart';
import 'package:zaracast/src/features/settings/data/params/create_settings_params.dart';
import 'package:zaracast/src/features/settings/data/params/stream_settings_params.dart';
import 'package:zaracast/src/features/settings/data/params/update_theme_mode_params.dart';
import 'package:zaracast/src/features/settings/data/params/update_theme_params.dart';

abstract class SettingsLocalDataSource {
  Future<void> createSettings(CreateSettingsParams params);
  Stream<SettingsModel> streamSettings(StreamSettingsParams params);
  Future<void> updateTheme(UpdateThemeParams params);
  Future<void> updateThemeMode(UpdateThemeModeParams params);
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  SettingsLocalDataSourceImpl({required this.appDatabase});

  final AppDatabase appDatabase;

  /// Create a settings record in the database if it does not exist.
  @override
  Future<void> createSettings(CreateSettingsParams params) async {
    final operation = appDatabase.managers.userSettings.create(
      (companion) => companion(
        userId: params.settingsEntity.userId,
        theme: params.settingsEntity.theme.name,
        themeMode: params.settingsEntity.themeMode.name,
      ),
      mode: InsertMode.insertOrRollback,
    );

    await appDatabase.execute<void>(() async => operation);
  }

  @override
  Stream<SettingsModel> streamSettings(StreamSettingsParams params) {
    return appDatabase.managers.userSettings.watchSingle().map((row) {
      return SettingsModel.fromJson(row.toJson());
    }).handleError((Object error) {
      if (kDebugMode) {
        debugPrint('streamUserSettings() unhandled error: $error');
      }
    });
  }

  @override
  Future<void> updateTheme(UpdateThemeParams params) async {
    final operation = appDatabase.managers.userSettings
        .filter((f) => f.userId(params.userId))
        .update(
          (companion) => companion(
            theme: Value(params.theme.name),
          ),
        );

    await appDatabase.execute<void>(() async => operation);
  }

  @override
  Future<void> updateThemeMode(UpdateThemeModeParams params) async {
    final operation = appDatabase.managers.userSettings
        .filter((f) => f.userId(params.userId))
        .update(
          (companion) => companion(
            themeMode: Value(params.themeMode.name),
          ),
        );

    await appDatabase.execute<void>(() async => operation);
  }
}
