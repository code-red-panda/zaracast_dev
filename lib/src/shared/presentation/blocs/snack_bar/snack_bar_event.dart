part of 'snack_bar_bloc.dart';

sealed class SnackBarEvent extends Equatable {
  const SnackBarEvent();

  @override
  List<Object> get props => [];
}

final class SnackBarShowEvent extends SnackBarEvent {
  const SnackBarShowEvent(this.userMessage);

  final String userMessage;

  @override
  List<Object> get props => [userMessage];
}

final class ClearSnackBarEvent extends SnackBarEvent {
  const ClearSnackBarEvent();
}
