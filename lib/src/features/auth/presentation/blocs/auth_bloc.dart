import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaracast/src/features/auth/data/params/sign_in_with_email_params.dart';
import 'package:zaracast/src/features/auth/data/params/sign_in_with_phone_params.dart';
import 'package:zaracast/src/features/auth/data/params/verify_email_otp_params.dart';
import 'package:zaracast/src/features/auth/data/params/verify_phone_otp_params.dart';
import 'package:zaracast/src/features/auth/domain/entities/auth_user_entity.dart';
import 'package:zaracast/src/features/auth/domain/use_cases/sign_in_anonymously_use_case.dart';
import 'package:zaracast/src/features/auth/domain/use_cases/sign_in_with_email_use_case.dart';
import 'package:zaracast/src/features/auth/domain/use_cases/sign_in_with_phone_use_case.dart';
import 'package:zaracast/src/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:zaracast/src/features/auth/domain/use_cases/verify_email_otp_use_case.dart';
import 'package:zaracast/src/features/auth/domain/use_cases/verify_phone_otp_use_case.dart';
import 'package:zaracast/src/shared/data/params/no_params.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    SignInAnonymouslyUseCase signInAnonymouslyUseCase,
    SignInWithEmailUseCase signInWithEmailUseCase,
    SignInWithPhoneUseCase signInWithPhoneUseCase,
    SignOutUseCase signOutUseCase,
    VerifyEmailOtpUseCase verifyEmailOtpUseCase,
    VerifyPhoneOtpUseCase verifyPhoneOtpUseCase,
  )   : _signInAnonymouslyUseCase = signInAnonymouslyUseCase,
        _signInWithEmailUseCase = signInWithEmailUseCase,
        _signInWithPhoneUseCase = signInWithPhoneUseCase,
        _signOutUseCase = signOutUseCase,
        _verifyEmailOtpUseCase = verifyEmailOtpUseCase,
        _verifyPhoneOtpUseCase = verifyPhoneOtpUseCase,
        super(const AuthInitial()) {
    // TODO(red): Add auth stream in S2? Or use supabase client?
    /*
    _authStatusStream = _authRepo.authStatus.listen(
      (status) => add(AuthStatusChanged(status)),
    );*/

    on<SignInAnonymously>(_onSignInAnonymously);
    on<SignInWithEmail>(_onSignInWithEmail);
    on<SignInWithPhone>(_onSignInWithPhone);
    on<SignOut>(_onSignOut);
    on<VerifyEmailOtp>(_onVerifyEmailOtp);
    on<VerifyPhoneOtp>(_onVerifyPhoneOtp);
    on<AuthClearError>(_onClearError);
  }

  final SignInAnonymouslyUseCase _signInAnonymouslyUseCase;
  final SignInWithEmailUseCase _signInWithEmailUseCase;
  final SignInWithPhoneUseCase _signInWithPhoneUseCase;
  final SignOutUseCase _signOutUseCase;
  final VerifyEmailOtpUseCase _verifyEmailOtpUseCase;
  final VerifyPhoneOtpUseCase _verifyPhoneOtpUseCase;
  //late final StreamSubscription<AuthStatus> _authStatusStream;

  @override
  Future<void> close() {
    //_authStatusStream.cancel();
    return super.close();
  }

  Future<void> _onSignInAnonymously(
    SignInAnonymously event,
    Emitter<AuthState> emit,
  ) async {
    if (state is AuthLoading) return;

    emit(const AuthLoading());

    final result = await _signInAnonymouslyUseCase.call(event.params);

    if (result.isLeft) {
      emit(AuthError(result.left.userMessage));
    }
  }

  Future<void> _onSignInWithEmail(
    SignInWithEmail event,
    Emitter<AuthState> emit,
  ) async {
    if (state is AuthLoading) return;

    emit(const AuthLoading());

    final result = await _signInWithEmailUseCase.call(event.params);

    result.fold(
      (failure) {
        emit(AuthError(failure.userMessage));
      },
      (void _) {
        emit(EnterEmailOtp(event.params.email));
      },
    );
  }

  Future<void> _onSignInWithPhone(
    SignInWithPhone event,
    Emitter<AuthState> emit,
  ) async {
    if (state is AuthLoading) return;

    emit(const AuthLoading());

    final result = await _signInWithPhoneUseCase.call(event.params);

    result.fold(
      (failure) {
        emit(AuthError(failure.userMessage));
      },
      (void _) {
        emit(EnterPhoneOtp(event.params.phone));
      },
    );
  }

  Future<void> _onSignOut(
    SignOut event,
    Emitter<AuthState> emit,
  ) async {
    if (state is AuthLoading) return;

    emit(const AuthLoading());

    final result = await _signOutUseCase.call(event.params);

    if (result.isLeft) {
      emit(AuthError(result.left.userMessage));
    }
  }

  Future<void> _onVerifyEmailOtp(
    VerifyEmailOtp event,
    Emitter<AuthState> emit,
  ) async {
    if (state is AuthLoading) return;

    emit(const AuthLoading());

    final result = await _verifyEmailOtpUseCase.call(event.params);

    if (result.isLeft) {
      emit(AuthError(result.left.userMessage));
    }
  }

  Future<void> _onVerifyPhoneOtp(
    VerifyPhoneOtp event,
    Emitter<AuthState> emit,
  ) async {
    if (state is AuthLoading) return;

    emit(const AuthLoading());

    final result = await _verifyPhoneOtpUseCase.call(event.params);

    if (result.isLeft) {
      emit(AuthError(result.left.userMessage));
    }
  }

  void _onClearError(
    AuthClearError event,
    Emitter<AuthState> emit,
  ) {
    if (state is AuthError) {
      emit(const AuthInitial());
    }
  }
}
