import 'package:zaracast/src/core/constants/constants.dart';
import 'package:zaracast/src/core/dependency_injection/singletons.dart';
import 'package:zaracast/src/features/settings/data/data_sources/settings_local_data_source.dart';
import 'package:zaracast/src/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:zaracast/src/features/settings/domain/use_cases/create_settings_use_case.dart';
import 'package:zaracast/src/features/settings/domain/use_cases/stream_settings_use_case.dart';
import 'package:zaracast/src/features/settings/domain/use_cases/update_theme_mode_use_case.dart';
import 'package:zaracast/src/features/settings/domain/use_cases/update_theme_use_case.dart';
import 'package:zaracast/src/features/settings/presentation/blocs/settings_bloc.dart';

Future<void> registerSettingsSingletons() async {
  getIt
    // Repositories
    ..registerLazySingleton(
      () => SettingsRepositoryImpl(
        localDataSource: SettingsLocalDataSourceImpl(appDatabase: appDatabase),
      ),
    )

    // Blocs
    ..registerLazySingleton(
      () => SettingsBloc(
        placeHolderUserId,
        CreateSettingsUseCase(settingsRepository),
        StreamSettingsUseCase(settingsRepository),
        UpdateThemeUseCase(settingsRepository),
        UpdateThemeModeUseCase(settingsRepository),
      ),
    );
}

// Getters
SettingsBloc get settingsBloc => getIt.get<SettingsBloc>();

SettingsRepositoryImpl get settingsRepository =>
    getIt.get<SettingsRepositoryImpl>();
