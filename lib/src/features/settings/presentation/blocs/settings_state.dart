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
  const SettingsLoaded(this.theme, this.themeMode);

  final MaterialTheme theme;
  final ThemeMode themeMode;

  @override
  List<Object> get props => [theme, themeMode];
}

class SettingsError extends SettingsState {
  const SettingsError(this.userMessage);

  final String userMessage;

  @override
  List<Object> get props => [userMessage];
}
