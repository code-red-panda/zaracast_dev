import 'package:zaracast/src/core/errors/exceptions.dart';
import 'package:zaracast/src/features/auth/data/params/sign_in_with_email_params.dart';
import 'package:zaracast/src/features/auth/data/params/sign_in_with_phone_params.dart';
import 'package:zaracast/src/features/auth/data/params/verify_email_otp_params.dart';
import 'package:zaracast/src/features/auth/data/params/verify_phone_otp_params.dart';
import 'package:zaracast/src/shared/data/params/no_params.dart';

abstract class AuthRemoteDataSource {
  Future<void> signInAnonymously(NoParams params);
  Future<void> signInWithEmail(SignInWithEmailParams params);
  Future<void> signInWithPhone(SignInWithPhoneParams params);
  Future<void> signOut(NoParams params);
  Future<void> verifyEmailOtp(VerifyEmailOtpParams params);
  Future<void> verifyPhoneOtp(VerifyPhoneOtpParams params);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(/*this.s2*/);

  //final S2Client s2;
  // Or final SupabaseClient supabaseClient;

  @override
  Future<void> signInAnonymously(NoParams params) async {
    try {} catch (e, stackTrace) {
      throw ServerException.unknownError(stackTrace: stackTrace);
    }
  }

  @override
  Future<void> signInWithEmail(SignInWithEmailParams params) async {
    try {} catch (e, stackTrace) {
      throw ServerException.unknownError(
        stackTrace: stackTrace,
        arguments: {'email': params.email},
      );
    }
  }

  @override
  Future<void> signInWithPhone(SignInWithPhoneParams params) async {
    try {} catch (e, stackTrace) {
      throw ServerException.unknownError(
        stackTrace: stackTrace,
        arguments: {'phone': params.phone},
      );
    }
  }

  @override
  Future<void> signOut(NoParams params) async {
    try {} catch (e, stackTrace) {
      throw ServerException.unknownError(stackTrace: stackTrace);
    }
  }

  @override
  Future<void> verifyEmailOtp(VerifyEmailOtpParams params) async {
    try {} catch (e, stackTrace) {
      throw ServerException.unknownError(
        stackTrace: stackTrace,
        arguments: {'email': params.email, 'otp': params.otp},
      );
    }
  }

  @override
  Future<void> verifyPhoneOtp(VerifyPhoneOtpParams params) async {
    try {} catch (e, stackTrace) {
      throw ServerException.unknownError(
        stackTrace: stackTrace,
        arguments: {'phone': params.phone, 'otp': params.otp},
      );
    }
  }
}
