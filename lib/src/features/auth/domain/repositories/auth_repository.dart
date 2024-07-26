// ignore: one_member_abstracts
import 'package:either_dart/either.dart';
import 'package:zaracast/src/core/errors/failure.dart';
import 'package:zaracast/src/features/auth/data/params/sign_in_with_email_params.dart';
import 'package:zaracast/src/features/auth/data/params/sign_in_with_phone_params.dart';
import 'package:zaracast/src/features/auth/data/params/verify_email_otp_params.dart';
import 'package:zaracast/src/features/auth/data/params/verify_phone_otp_params.dart';
import 'package:zaracast/src/shared/data/params/no_params.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> signInAnonymously(NoParams params);
  Future<Either<Failure, void>> signInWithEmail(SignInWithEmailParams params);
  Future<Either<Failure, void>> signInWithPhone(SignInWithPhoneParams params);
  Future<Either<Failure, void>> signOut(NoParams params);
  Future<Either<Failure, void>> verifyEmailOtp(VerifyEmailOtpParams params);
  Future<Either<Failure, void>> verifyPhoneOtp(VerifyPhoneOtpParams params);
}
