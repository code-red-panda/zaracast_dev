import 'package:either_dart/either.dart';
import 'package:zaracast/src/core/errors/failure.dart';
import 'package:zaracast/src/core/utils/use_case_types.dart';
import 'package:zaracast/src/features/auth/data/params/verify_email_otp_params.dart';
import 'package:zaracast/src/features/auth/domain/repositories/auth_repository.dart';

class VerifyEmailOtpUseCase extends AsyncUseCase<void, VerifyEmailOtpParams> {
  VerifyEmailOtpUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, void>> call(VerifyEmailOtpParams params) async {
    final result = await authRepository.verifyEmailOtp(params);

    return result.fold(Left.new, Right.new);
  }
}
