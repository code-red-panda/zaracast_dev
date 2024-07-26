import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'snack_bar_event.dart';
part 'snack_bar_state.dart';

class SnackBarBloc extends Bloc<SnackBarEvent, SnackBarState> {
  SnackBarBloc() : super(const SnackBarInitial()) {
    on<SnackBarShowEvent>(_onSnackbarShow);
    on<ClearSnackBarEvent>(_onClearSnackbar);
  }

  void _onSnackbarShow(
    SnackBarShowEvent event,
    Emitter<SnackBarState> emit,
  ) {
    emit(SnackBarLoaded(event.userMessage));
  }

  void _onClearSnackbar(
    ClearSnackBarEvent event,
    Emitter<SnackBarState> emit,
  ) {
    emit(const SnackBarInitial());
  }
}
