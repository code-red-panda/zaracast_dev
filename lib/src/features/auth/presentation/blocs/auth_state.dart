part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class Authenticated extends AuthState {
  const Authenticated(this.user);

  final AuthUserEntity user;

  @override
  List<Object> get props => [user];
}

class Unauthenticated extends AuthState {
  const Unauthenticated();
}

class EnterEmailOtp extends AuthState {
  const EnterEmailOtp(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class EnterPhoneOtp extends AuthState {
  const EnterPhoneOtp(this.phone);

  final String phone;

  @override
  List<Object> get props => [phone];
}

class AuthError extends AuthState {
  const AuthError(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
