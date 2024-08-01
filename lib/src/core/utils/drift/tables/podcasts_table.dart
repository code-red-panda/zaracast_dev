import 'package:drift/drift.dart';
import 'package:zaracast/src/core/utils/drift/utils/json_converter.dart';

class Podcasts extends Table {
  IntColumn get id => integer()();
  TextColumn get podcastGuid => text()();
  TextColumn get title => text()();
  TextColumn get url => text()();
  TextColumn get originalUrl => text()();
  TextColumn get link => text()();
  TextColumn get description => text()();
  TextColumn get author => text()();
  TextColumn get ownerName => text()();
  TextColumn get image => text()();
  TextColumn get artwork => text()();
  IntColumn get lastUpdateTime => integer()();
  IntColumn get lastCrawlTime => integer()();
  IntColumn get lastParseTime => integer()();
  IntColumn get lastGoodHttpStatusTime => integer()();
  IntColumn get lastHttpStatus => integer()();
  TextColumn get contentType => text()();
  IntColumn get itunesId => integer().nullable()();
  TextColumn get itunesType => text().nullable()();
  TextColumn get generator => text().nullable()();
  TextColumn get language => text()();
  BoolColumn get explicit => boolean()();
  IntColumn get type => integer()();
  TextColumn get medium => text()();
  IntColumn get dead => integer()();
  TextColumn get chash => text().nullable()();
  IntColumn get episodeCount => integer()();
  IntColumn get crawlErrors => integer()();
  IntColumn get parseErrors => integer()();
  TextColumn get categories => text().nullable().map(const JsonConverter())();
  IntColumn get locked => integer()();
  IntColumn get imageUrlHash => integer()();
  TextColumn get value => text().nullable().map(const JsonConverter())();
  TextColumn get funding => text().nullable().map(const JsonConverter())();
  IntColumn get newestItemPubdate => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
