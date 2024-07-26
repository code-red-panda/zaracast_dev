import 'package:either_dart/either.dart';
import 'package:zaracast/src/core/errors/failure.dart';
import 'package:zaracast/src/core/utils/use_case_types.dart';
import 'package:zaracast/src/features/auth/data/params/sign_in_with_phone_params.dart';
import 'package:zaracast/src/features/auth/domain/repositories/auth_repository.dart';

class SignInWithPhoneUseCase extends AsyncUseCase<void, SignInWithPhoneParams> {
  SignInWithPhoneUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, void>> call(SignInWithPhoneParams params) async {
    final result = await authRepository.signInWithPhone(params);

    return result.fold(Left.new, Right.new);
  }
}
