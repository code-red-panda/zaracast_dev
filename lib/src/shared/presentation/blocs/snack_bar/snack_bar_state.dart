part of 'snack_bar_bloc.dart';

sealed class SnackBarState extends Equatable {
  const SnackBarState();

  @override
  List<Object> get props => [];
}

final class SnackBarInitial extends SnackBarState {
  const SnackBarInitial();
}

final class SnackBarLoaded extends SnackBarState {
  const SnackBarLoaded(this.userMessage);

  final String userMessage;

  @override
  List<Object> get props => [userMessage];
}
