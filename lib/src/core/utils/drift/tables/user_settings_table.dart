import 'package:drift/drift.dart';

class UserSettings extends Table {
  TextColumn get userId => text()();
  TextColumn get theme => text()();
  TextColumn get themeMode => text()();

  @override
  Set<Column> get primaryKey => {userId};
}
