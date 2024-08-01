import 'package:drift/drift.dart';
import 'package:zaracast/src/core/utils/drift/tables/podcasts_table.dart';

class PodcastSearchHistory extends Table {
  IntColumn get id => integer().references(Podcasts, #id)();
  DateTimeColumn get searchedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
