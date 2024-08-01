import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:zaracast/src/core/errors/exceptions.dart';
import 'package:zaracast/src/core/errors/failure.dart';
import 'package:zaracast/src/features/settings/data/data_sources/settings_local_data_source.dart';
import 'package:zaracast/src/features/settings/data/models/settings_model.dart';
import 'package:zaracast/src/features/settings/data/params/create_settings_params.dart';
import 'package:zaracast/src/features/settings/data/params/stream_settings_params.dart';
import 'package:zaracast/src/features/settings/data/params/update_theme_mode_params.dart';
import 'package:zaracast/src/features/settings/data/params/update_theme_params.dart';
import 'package:zaracast/src/features/settings/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl({required this.localDataSource});

  final SettingsLocalDataSource localDataSource;

  @override
  Future<Either<Failure, void>> createSettings(
    CreateSettingsParams params,
  ) async {
    try {
      final result = await localDataSource.createSettings(params);

      return Right(result);
    } on LocalException catch (e) {
      return Left(LocalFailure(e.message));
    }
  }

  @override
  Either<Failure, Stream<SettingsModel>> streamSettings(
    StreamSettingsParams params,
  ) {
    try {
      final result = localDataSource.streamSettings(params);

      return Right(result);
    } on LocalException catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }

      return Left(LocalFailure('Error streaming settings'));
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint('Generic Exception: $e');
      }

      return Left(LocalFailure('Error streaming settings'));
    }
  }

  @override
  Future<Either<Failure, void>> updateTheme(
    UpdateThemeParams params,
  ) async {
    try {
      final result = await localDataSource.updateTheme(params);

      return Right(result);
    } on LocalException catch (e) {
      return Left(LocalFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> updateThemeMode(
    UpdateThemeModeParams params,
  ) async {
    try {
      final result = await localDataSource.updateThemeMode(params);

      return Right(result);
    } on LocalException catch (e) {
      return Left(LocalFailure(e.message));
    }
  }
}
