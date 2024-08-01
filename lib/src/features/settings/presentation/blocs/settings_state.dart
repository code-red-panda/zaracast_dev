part of 'settings_bloc.dart';

@immutable
sealed class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {
  const SettingsInitial();
}

class SettingsLoading extends SettingsState {
  const SettingsLoading();
}

class SettingsLoaded extends SettingsState {
  const SettingsLoaded(this.settings);

  final SettingsEntity settings;

  @override
  List<Object> get props => [settings];
}

class SettingsError extends SettingsState {
  const SettingsError(this.userMessage);

  final String userMessage;

  @override
  List<Object> get props => [userMessage];
}
