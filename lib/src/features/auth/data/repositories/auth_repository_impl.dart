import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:zaracast/src/core/errors/exceptions.dart';
import 'package:zaracast/src/core/errors/failure.dart';
import 'package:zaracast/src/core/network/network_info.dart';
import 'package:zaracast/src/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:zaracast/src/features/auth/data/params/sign_in_with_email_params.dart';
import 'package:zaracast/src/features/auth/data/params/sign_in_with_phone_params.dart';
import 'package:zaracast/src/features/auth/data/params/verify_email_otp_params.dart';
import 'package:zaracast/src/features/auth/data/params/verify_phone_otp_params.dart';
import 'package:zaracast/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:zaracast/src/shared/data/params/no_params.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, void>> signInAnonymously(NoParams params) async {
    try {
      if (!await networkInfo.hasInternet) {
        throw const ServerException.noInternetConnection();
      }

      await remoteDataSource.signInAnonymously(params);

      return const Right(null);
    } on ServerException catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }

      if (e.statusCode == 1) {
        return Left(ServerFailure('No internet connection'));
      }

      return Left(ServerFailure('Error signing in anonymously'));
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint('Generic Exception: $e');
      }

      return Left(ServerFailure('Error signing in anonymously'));
    }
  }

  @override
  Future<Either<Failure, void>> signInWithEmail(
    SignInWithEmailParams params,
  ) async {
    try {
      if (!await networkInfo.hasInternet) {
        throw ServerException.noInternetConnection(
          arguments: {'email': params.email},
        );
      }

      await remoteDataSource.signInWithEmail(params);

      return const Right(null);
    } on ServerException catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }

      if (e.statusCode == 1) {
        return Left(ServerFailure('No internet connection'));
      }

      return Left(ServerFailure('Error signing in with email'));
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint('Generic Exception: $e');
      }

      return Left(ServerFailure('Error signing in with email'));
    }
  }

  @override
  Future<Either<Failure, void>> signInWithPhone(
    SignInWithPhoneParams params,
  ) async {
    try {
      if (!await networkInfo.hasInternet) {
        throw ServerException.noInternetConnection(
          arguments: {'phone': params.phone},
        );
      }

      await remoteDataSource.signInWithPhone(params);

      return const Right(null);
    } on ServerException catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }

      if (e.statusCode == 1) {
        return Left(ServerFailure('No internet connection'));
      }

      return Left(ServerFailure('Error signing in with phone'));
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint('Generic Exception: $e');
      }

      return Left(ServerFailure('Error signing in with phone'));
    }
  }

  @override
  Future<Either<Failure, void>> signOut(NoParams params) async {
    try {
      if (!await networkInfo.hasInternet) {
        throw const ServerException.noInternetConnection();
      }

      await remoteDataSource.signOut(params);

      return const Right(null);
    } on ServerException catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }

      if (e.statusCode == 1) {
        return Left(ServerFailure('No internet connection'));
      }

      return Left(ServerFailure('Error signing out'));
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint('Generic Exception: $e');
      }

      return Left(ServerFailure('Error signing out'));
    }
  }

  @override
  Future<Either<Failure, void>> verifyEmailOtp(
    VerifyEmailOtpParams params,
  ) async {
    try {
      if (!await networkInfo.hasInternet) {
        throw ServerException.noInternetConnection(
          arguments: {'email': params.email},
        );
      }

      await remoteDataSource.verifyEmailOtp(params);

      return const Right(null);
    } on ServerException catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }

      if (e.statusCode == 1) {
        return Left(ServerFailure('No internet connection'));
      }

      return Left(ServerFailure('Error verifying email passcode'));
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint('Generic Exception: $e');
      }

      return Left(ServerFailure('Error verifying email passcode'));
    }
  }

  @override
  Future<Either<Failure, void>> verifyPhoneOtp(
    VerifyPhoneOtpParams params,
  ) async {
    try {
      if (!await networkInfo.hasInternet) {
        throw ServerException.noInternetConnection(
          arguments: {'phone': params.phone},
        );
      }

      await remoteDataSource.verifyPhoneOtp(params);

      return const Right(null);
    } on ServerException catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }

      if (e.statusCode == 1) {
        return Left(ServerFailure('No internet connection'));
      }

      return Left(ServerFailure('Error verifying phone passcode'));
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint('Generic Exception: $e');
      }

      return Left(ServerFailure('Error verifying phone passcode'));
    }
  }
}
