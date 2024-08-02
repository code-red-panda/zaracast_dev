// 1-99 network/request errors
// 100-199 data errors
// 999 unknown error

class ServerException implements Exception {
  ServerException(
    this.message,
    this.statusCode,
    this.stackTrace, {
    this.arguments,
  });

  const ServerException.noInternetConnection({this.arguments})
      : message = 'No internet connection',
        statusCode = 1,
        stackTrace = StackTrace.empty;

  const ServerException.badRequest({
    required int responseCode,
    required String statusMessage,
    this.arguments,
  })  : message = '$responseCode bad request: $statusMessage',
        statusCode = 1,
        stackTrace = StackTrace.empty;

  const ServerException.dioError({
    required String dioMessage,
    required this.stackTrace,
    this.arguments,
  })  : message = 'Dio Exception: $dioMessage',
        statusCode = 20;

  const ServerException.emptyResponse({this.arguments})
      : message = 'Empty response',
        statusCode = 100,
        stackTrace = StackTrace.empty;

  const ServerException.unexpectedDataFormat({
    required Type expectedType,
    required Type receivedType,
    this.arguments,
  })  : message = 'Unexpected data format. '
            'Expected type $expectedType but received type $receivedType.',
        statusCode = 100,
        stackTrace = StackTrace.empty;

  const ServerException.unknownError({
    required this.stackTrace,
    this.arguments,
  })  : message = 'Unknown error',
        statusCode = 999;

  final String message;
  final int statusCode;
  final StackTrace stackTrace;
  final Map<String, dynamic>? arguments;

  @override
  String toString() {
    final buffer = StringBuffer()
      ..write('Server Exception\n===============\n'
          '$message (status code: $statusCode)\n');

    if (arguments != null && arguments!.isNotEmpty) {
      arguments!.forEach((key, value) {
        buffer.write('$key: $value\n');
      });
    }
    buffer.write('$stackTrace');

    return buffer.toString();
  }
}

class LocalException implements Exception {
  LocalException(
    this.message,
    this.statusCode,
    this.stackTrace, {
    this.arguments,
  });

  const LocalException.emptyResults({this.arguments})
      : message = 'Empty results',
        statusCode = 100,
        stackTrace = StackTrace.empty;

  LocalException.sqliteError({
    required String message,
    required this.stackTrace,
    String? causingStatement,
    List<Object?>? parametersToStatement,
    String? explanation,
  })  : message = 'Sqlite error - $message',
        statusCode = 101,
        arguments = {
          'statement': causingStatement,
          'parameters': parametersToStatement,
          'explanation': explanation,
        };

  LocalException.unknownDriftError({
    required String remoteCause,
    required Type exceptionType,
    required this.stackTrace,
  })  : message = 'Unknown Drift error - $remoteCause',
        statusCode = 102,
        arguments = {'exceptionType': exceptionType};

  const LocalException.unknownError({
    required this.stackTrace,
    this.arguments,
  })  : message = 'Unknown error',
        statusCode = 999;

  final String message;
  final int statusCode;
  final StackTrace stackTrace;
  final Map<String, dynamic>? arguments;

  @override
  String toString() {
    final buffer = StringBuffer()
      ..write('\nLocal Exception\n===============\n'
          '$message (status code: $statusCode)\n');

    if (arguments != null && arguments!.isNotEmpty) {
      arguments!.forEach((key, value) {
        buffer.write('$key: $value\n');
      });
    }
    buffer.write('$stackTrace');

    return buffer.toString();
  }
}
