import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaracast/src/features/settings/data/params/create_settings_params.dart';
import 'package:zaracast/src/features/settings/data/params/stream_settings_params.dart';
import 'package:zaracast/src/features/settings/data/params/update_theme_mode_params.dart';
import 'package:zaracast/src/features/settings/data/params/update_theme_params.dart';
import 'package:zaracast/src/features/settings/domain/entities/settings_entity.dart';
import 'package:zaracast/src/features/settings/domain/use_cases/create_settings_use_case.dart';
import 'package:zaracast/src/features/settings/domain/use_cases/stream_settings_use_case.dart';
import 'package:zaracast/src/features/settings/domain/use_cases/update_theme_mode_use_case.dart';
import 'package:zaracast/src/features/settings/domain/use_cases/update_theme_use_case.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc(
    CreateSettingsParams createSettingsParams,
    StreamSettingsParams streamSettingsParams,
    CreateSettingsUseCase createSettingsUseCase,
    StreamSettingsUseCase streamSettingsUseCase,
    UpdateThemeUseCase updateThemeUseCase,
    UpdateThemeModeUseCase updateThemeModeUseCase,
  )   : _createSettingsUseCase = createSettingsUseCase,
        _streamSettingsUseCase = streamSettingsUseCase,
        _updateThemeUseCase = updateThemeUseCase,
        _updateThemeModeUseCase = updateThemeModeUseCase,
        super(const SettingsInitial()) {
    on<CreateSettingsEvent>(_onCreateSettings);
    on<StreamSettingsEvent>(_onStreamSettings);
    on<_StreamUpdateSettingsEvent>(_onStreamUpdateSettings);
    on<UpdateThemeEvent>(_onUpdateTheme);
    on<UpdateThemeModeEvent>(_onUpdateThemeMode);

    // Initialize the bloc
    add(CreateSettingsEvent(createSettingsParams));
    add(StreamSettingsEvent(streamSettingsParams));
  }

  final CreateSettingsUseCase _createSettingsUseCase;
  final StreamSettingsUseCase _streamSettingsUseCase;
  final UpdateThemeUseCase _updateThemeUseCase;
  final UpdateThemeModeUseCase _updateThemeModeUseCase;
  StreamSubscription<SettingsEntity>? _settingsSubscription;

  @override
  Future<void> close() async {
    await _settingsSubscription?.cancel();
    return super.close();
  }

  Future<void> _onCreateSettings(
    CreateSettingsEvent event,
    Emitter<SettingsState> emit,
  ) async {
    final result = await _createSettingsUseCase.call(event.params);

    if (result.isLeft) {
      emit(SettingsError(result.left.userMessage));
    }
  }

  void _onStreamSettings(
    StreamSettingsEvent event,
    Emitter<SettingsState> emit,
  ) {
    unawaited(_settingsSubscription?.cancel());

    final result = _streamSettingsUseCase.call(event.params);

    // ignore: cascade_invocations
    result.fold(
      (failure) => emit(SettingsError(failure.userMessage)),
      (stream) {
        _settingsSubscription = stream.listen(
          (settings) {
            add(_StreamUpdateSettingsEvent(settings));
          },
          onError: (Object error) {
            if (kDebugMode) {
              debugPrint('_onStreamSettings() unhandled error: $error');
            }
          },
        );
      },
    );
  }

  void _onStreamUpdateSettings(
    _StreamUpdateSettingsEvent event,
    Emitter<SettingsState> emit,
  ) {
    emit(SettingsLoaded(event.settingsEntity));
  }

  Future<void> _onUpdateTheme(
    UpdateThemeEvent event,
    Emitter<SettingsState> emit,
  ) async {
    final result = await _updateThemeUseCase.call(event.params);

    if (result.isLeft) {
      emit(SettingsError(result.left.userMessage));
    }
  }

  Future<void> _onUpdateThemeMode(
    UpdateThemeModeEvent event,
    Emitter<SettingsState> emit,
  ) async {
    final result = await _updateThemeModeUseCase.call(event.params);

    if (result.isLeft) {
      emit(SettingsError(result.left.userMessage));
    }
  }
}
