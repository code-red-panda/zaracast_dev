import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift/remote.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:zaracast/src/core/errors/exceptions.dart';
import 'package:zaracast/src/core/utils/drift/tables/podcast_search_history_table.dart';
import 'package:zaracast/src/core/utils/drift/tables/podcasts_table.dart';
import 'package:zaracast/src/core/utils/drift/tables/user_settings_table.dart';
import 'package:zaracast/src/core/utils/drift/utils/json_converter.dart';

part 'app_database.g.dart';

/// Table documentation:
/// https://drift.simonbinder.eu/docs/getting-started/advanced_dart_tables/

@DriftDatabase(
  tables: [
    Podcasts,
    PodcastSearchHistory,
    UserSettings,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() => driftDatabase(name: 'zaracast');

  /// Execute a statement and handle exceptions.
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
