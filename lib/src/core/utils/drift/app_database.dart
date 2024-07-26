import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

class Settings extends Table {
  TextColumn get userId => text()();
  TextColumn get theme => text()();
  TextColumn get themeMode => text()();

  @override
  Set<Column> get primaryKey => {userId};
}
/*
class MyPokemon extends Table {
  TextColumn get userId => text()();
  IntColumn get pokemonId => integer().references(Pokemon, #id)();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {userId, pokemonId};
}*/

@DriftDatabase(tables: [Settings])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() => driftDatabase(name: 'zaracast');
}
