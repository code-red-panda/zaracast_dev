part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class UpdateThemeEvent extends SettingsEvent {
  const UpdateThemeEvent(this.params);

  final UpdateThemeParams params;

  @override
  List<Object> get props => [params];
}

class UpdateThemeModeEvent extends SettingsEvent {
  const UpdateThemeModeEvent(this.params);

  final UpdateThemeModeParams params;

  @override
  List<Object> get props => [params];
}
