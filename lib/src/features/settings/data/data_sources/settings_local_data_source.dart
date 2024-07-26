import 'package:zaracast/src/core/errors/exceptions.dart';
import 'package:zaracast/src/features/settings/data/params/update_theme_mode_params.dart';
import 'package:zaracast/src/features/settings/data/params/update_theme_params.dart';

abstract class SettingsLocalDataSource {
  Future<void> updateTheme(UpdateThemeParams params);
  Future<void> updateThemeMode(UpdateThemeModeParams params);
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  SettingsLocalDataSourceImpl(/*this.s2*/);

  //final S2Client s2;
  @override
  Future<void> updateTheme(UpdateThemeParams params) async {
    try {
      // await s2.updateThemeMode(params);
    } catch (e, stackTrace) {
      throw LocalException.unknownError(stackTrace: stackTrace);
    }
  }

  @override
  Future<void> updateThemeMode(UpdateThemeModeParams params) async {
    try {
      // await s2.updateThemeMode(params);
    } catch (e, stackTrace) {
      throw LocalException.unknownError(stackTrace: stackTrace);
    }
  }
}
