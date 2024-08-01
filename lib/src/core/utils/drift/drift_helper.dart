import 'package:drift/native.dart';
import 'package:drift/remote.dart';
import 'package:zaracast/src/core/errors/exceptions.dart';

class DriftHelper {
  Future<T> execute<T>(Future<T> Function() operation) async {
    try {
      return await operation();
    } on DriftRemoteException catch (e, stackTrace) {
      final exception = e.remoteCause;

      if (exception is SqliteException) {
        throw LocalException.sqliteError(
          message: exception.message,
          stackTrace: stackTrace,
          causingStatement: exception.causingStatement,
          parametersToStatement: exception.parametersToStatement,
          explanation: exception.explanation,
        );
      } else {
        throw LocalException.unknownDriftError(
          remoteCause: '$exception',
          exceptionType: exception.runtimeType,
          stackTrace: stackTrace,
        );
      }
    } catch (e, stackTrace) {
      throw LocalException.unknownError(stackTrace: stackTrace);
    }
  }
}
