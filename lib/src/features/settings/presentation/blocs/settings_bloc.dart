import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaracast/src/core/themes/material_theme.dart';
import 'package:zaracast/src/features/settings/data/params/update_theme_mode_params.dart';
import 'package:zaracast/src/features/settings/data/params/update_theme_params.dart';
import 'package:zaracast/src/features/settings/domain/use_cases/update_theme_mode_use_case.dart';
import 'package:zaracast/src/features/settings/domain/use_cases/update_theme_use_case.dart';

part 'settings_event.dart';
part 'settings_state.dart';

/// TODO JAKE YOU ARE HERE ONCE CREATED A TABLE THEN HAVE THE BLOC READ IT AND SET STATE TO LOADED
/// ALSO CHANGE INITIAL STATE BACK TO SETTINGSINITIAL INSTEAD OF SETTINGSLOADED
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc(
    UpdateThemeUseCase updateThemeUseCase,
    UpdateThemeModeUseCase updateThemeModeUseCase,
  )   : _updateThemeUseCase = updateThemeUseCase,
        _updateThemeModeUseCase = updateThemeModeUseCase,
        super(
            const SettingsLoaded(MaterialTheme.ghostSpider, ThemeMode.system)) {
    on<UpdateThemeEvent>(_onUpdateTheme);
    on<UpdateThemeModeEvent>(_onUpdateThemeMode);
  }
  final UpdateThemeUseCase _updateThemeUseCase;
  final UpdateThemeModeUseCase _updateThemeModeUseCase;

  Future<void> _onUpdateTheme(
    UpdateThemeEvent event,
    Emitter<SettingsState> emit,
  ) async {
    //final result = await _updateThemeUseCase.call(event.params);
    //if (state is! SettingsLoaded) return;

    final currentState = state as SettingsLoaded;
    emit(SettingsLoaded(event.params.theme, currentState.themeMode));
  }

  Future<void> _onUpdateThemeMode(
    UpdateThemeModeEvent event,
    Emitter<SettingsState> emit,
  ) async {
    //final result = await _updateThemeModeUseCase.call(event.params);
    //if (state is! SettingsLoaded) return;

    final currentState = state as SettingsLoaded;
    emit(SettingsLoaded(currentState.theme, event.params.themeMode));
  }
}
