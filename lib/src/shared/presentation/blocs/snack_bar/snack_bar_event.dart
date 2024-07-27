part of 'snack_bar_bloc.dart';

sealed class SnackBarEvent extends Equatable {
  const SnackBarEvent();

  @override
  List<Object> get props => [];
}

final class ShowSnackBarEvent extends SnackBarEvent {
  const ShowSnackBarEvent(this.userMessage);

  final String userMessage;

  @override
  List<Object> get props => [userMessage];
}

final class ClearSnackBarEvent extends SnackBarEvent {
  const ClearSnackBarEvent();
}
