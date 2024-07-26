// ignore: one_member_abstracts
import 'package:either_dart/either.dart';
import 'package:zaracast/src/core/errors/failure.dart';
import 'package:zaracast/src/features/settings/data/params/update_theme_mode_params.dart';
import 'package:zaracast/src/features/settings/data/params/update_theme_params.dart';

abstract class SettingsRepository {
  Future<Either<Failure, void>> updateTheme(UpdateThemeParams params);
  Future<Either<Failure, void>> updateThemeMode(UpdateThemeModeParams params);
}
