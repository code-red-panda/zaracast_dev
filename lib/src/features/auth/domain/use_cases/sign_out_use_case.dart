import 'package:either_dart/either.dart';
import 'package:zaracast/src/core/errors/failure.dart';
import 'package:zaracast/src/core/utils/use_case_types.dart';
import 'package:zaracast/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:zaracast/src/shared/data/params/no_params.dart';

class SignOutUseCase extends AsyncUseCase<void, NoParams> {
  SignOutUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    final result = await authRepository.signOut(params);

    return result.fold(Left.new, Right.new);
  }
}
