import 'package:either_dart/either.dart';
import 'package:zaracast/src/core/errors/failure.dart';

// ignore: one_member_abstracts
abstract class UseCase<T, Params> {
  Either<Failure, T?> call(Params params);
}

// ignore: one_member_abstracts
abstract class AsyncUseCase<T, Params> {
  Future<Either<Failure, T?>> call(Params params);
}
