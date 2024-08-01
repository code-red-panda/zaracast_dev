import 'dart:convert';

import 'package:drift/drift.dart';

/// Convert a Map<String, dynamic> to a JSON string and vice versa.
///
/// This converter is used when defining Drift tables. For example:
///
/// The property:
///   Map<String, dynamic>? categories;
///
/// The column:
///   TextColumn get categories =>
///     text().nullable().map(const JsonConverter())();
class JsonConverter extends TypeConverter<Map<String, dynamic>, String> {
  const JsonConverter();

  @override
  Map<String, dynamic> fromSql(String fromDb) {
    return jsonDecode(fromDb) as Map<String, dynamic>;
  }

  @override
  String toSql(Map<String, dynamic> value) {
    return jsonEncode(value);
  }
}
