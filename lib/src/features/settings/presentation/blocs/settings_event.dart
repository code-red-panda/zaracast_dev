part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class CreateSettingsEvent extends SettingsEvent {
  const CreateSettingsEvent(this.params);

  final CreateSettingsParams params;
}

class StreamSettingsEvent extends SettingsEvent {
  const StreamSettingsEvent(this.params);

  final StreamSettingsParams params;
}

class _StreamUpdateSettingsEvent extends SettingsEvent {
  const _StreamUpdateSettingsEvent(this.settingsEntity);

  final SettingsEntity settingsEntity;
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
