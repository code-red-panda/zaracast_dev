import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:zaracast/src/core/utils/drift/drift_helper.dart';

part 'app_database.g.dart';

class UserSettings extends Table {
  TextColumn get userId => text()();//.references(Users, #id)();
  TextColumn get theme => text()();
  TextColumn get themeMode => text()();

  @override
  Set<Column> get primaryKey => {userId};
}

@DriftDatabase(tables: [UserSettings])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() => driftDatabase(name: 'zaracast');

  DriftHelper get helper => DriftHelper();
}
