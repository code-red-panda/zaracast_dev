abstract class Failure {
  const Failure(this.userMessage);

  final String userMessage;
}

class ServerFailure extends Failure {
  ServerFailure(super.userMessage);
}

class LocalFailure extends Failure {
  LocalFailure(super.userMessage);
}
