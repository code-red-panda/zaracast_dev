import 'package:either_dart/either.dart';
import 'package:zaracast/src/core/errors/failure.dart';
import 'package:zaracast/src/core/utils/use_case_types.dart';
import 'package:zaracast/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:zaracast/src/shared/data/params/no_params.dart';

class SignInAnonymouslyUseCase extends AsyncUseCase<void, NoParams> {
  SignInAnonymouslyUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    final result = await authRepository.signInAnonymously(params);

    return result.fold(Left.new, Right.new);
  }
}
