part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInAnonymously extends AuthEvent {
  const SignInAnonymously(this.params);

  final NoParams params;
}

class SignInWithEmail extends AuthEvent {
  const SignInWithEmail(this.params);

  final SignInWithEmailParams params;

  @override
  List<Object> get props => [params];
}

class SignInWithPhone extends AuthEvent {
  const SignInWithPhone(this.params);

  final SignInWithPhoneParams params;

  @override
  List<Object> get props => [params];
}

class SignOut extends AuthEvent {
  const SignOut(this.params);

  final NoParams params;
}

class VerifyEmailOtp extends AuthEvent {
  const VerifyEmailOtp(this.params);

  final VerifyEmailOtpParams params;

  @override
  List<Object> get props => [params];
}

class VerifyPhoneOtp extends AuthEvent {
  const VerifyPhoneOtp(this.params);

  final VerifyPhoneOtpParams params;

  @override
  List<Object> get props => [params];
}

class AuthClearError extends AuthEvent {
  const AuthClearError();
}
