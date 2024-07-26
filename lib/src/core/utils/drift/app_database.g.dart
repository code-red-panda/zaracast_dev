// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _themeMeta = const VerificationMeta('theme');
  @override
  late final GeneratedColumn<String> theme = GeneratedColumn<String>(
      'theme', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _themeModeMeta =
      const VerificationMeta('themeMode');
  @override
  late final GeneratedColumn<String> themeMode = GeneratedColumn<String>(
      'theme_mode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [userId, theme, themeMode];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(Insertable<Setting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('theme')) {
      context.handle(
          _themeMeta, theme.isAcceptableOrUnknown(data['theme']!, _themeMeta));
    } else if (isInserting) {
      context.missing(_themeMeta);
    }
    if (data.containsKey('theme_mode')) {
      context.handle(_themeModeMeta,
          themeMode.isAcceptableOrUnknown(data['theme_mode']!, _themeModeMeta));
    } else if (isInserting) {
      context.missing(_themeModeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      theme: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}theme'])!,
      themeMode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}theme_mode'])!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  final String userId;
  final String theme;
  final String themeMode;
  const Setting(
      {required this.userId, required this.theme, required this.themeMode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['theme'] = Variable<String>(theme);
    map['theme_mode'] = Variable<String>(themeMode);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      userId: Value(userId),
      theme: Value(theme),
      themeMode: Value(themeMode),
    );
  }

  factory Setting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      userId: serializer.fromJson<String>(json['userId']),
      theme: serializer.fromJson<String>(json['theme']),
      themeMode: serializer.fromJson<String>(json['themeMode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'theme': serializer.toJson<String>(theme),
      'themeMode': serializer.toJson<String>(themeMode),
    };
  }

  Setting copyWith({String? userId, String? theme, String? themeMode}) =>
      Setting(
        userId: userId ?? this.userId,
        theme: theme ?? this.theme,
        themeMode: themeMode ?? this.themeMode,
      );
  Setting copyWithCompanion(SettingsCompanion data) {
    return Setting(
      userId: data.userId.present ? data.userId.value : this.userId,
      theme: data.theme.present ? data.theme.value : this.theme,
      themeMode: data.themeMode.present ? data.themeMode.value : this.themeMode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('userId: $userId, ')
          ..write('theme: $theme, ')
          ..write('themeMode: $themeMode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, theme, themeMode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting &&
          other.userId == this.userId &&
          other.theme == this.theme &&
          other.themeMode == this.themeMode);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<String> userId;
  final Value<String> theme;
  final Value<String> themeMode;
  final Value<int> rowid;
  const SettingsCompanion({
    this.userId = const Value.absent(),
    this.theme = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettingsCompanion.insert({
    required String userId,
    required String theme,
    required String themeMode,
    this.rowid = const Value.absent(),
  })  : userId = Value(userId),
        theme = Value(theme),
        themeMode = Value(themeMode);
  static Insertable<Setting> custom({
    Expression<String>? userId,
    Expression<String>? theme,
    Expression<String>? themeMode,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (theme != null) 'theme': theme,
      if (themeMode != null) 'theme_mode': themeMode,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettingsCompanion copyWith(
      {Value<String>? userId,
      Value<String>? theme,
      Value<String>? themeMode,
      Value<int>? rowid}) {
    return SettingsCompanion(
      userId: userId ?? this.userId,
      theme: theme ?? this.theme,
      themeMode: themeMode ?? this.themeMode,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (theme.present) {
      map['theme'] = Variable<String>(theme.value);
    }
    if (themeMode.present) {
      map['theme_mode'] = Variable<String>(themeMode.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('userId: $userId, ')
          ..write('theme: $theme, ')
          ..write('themeMode: $themeMode, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SettingsTable settings = $SettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [settings];
}

typedef $$SettingsTableCreateCompanionBuilder = SettingsCompanion Function({
  required String userId,
  required String theme,
  required String themeMode,
  Value<int> rowid,
});
typedef $$SettingsTableUpdateCompanionBuilder = SettingsCompanion Function({
  Value<String> userId,
  Value<String> theme,
  Value<String> themeMode,
  Value<int> rowid,
});

class $$SettingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SettingsTable,
    Setting,
    $$SettingsTableFilterComposer,
    $$SettingsTableOrderingComposer,
    $$SettingsTableCreateCompanionBuilder,
    $$SettingsTableUpdateCompanionBuilder> {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SettingsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SettingsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> userId = const Value.absent(),
            Value<String> theme = const Value.absent(),
            Value<String> themeMode = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SettingsCompanion(
            userId: userId,
            theme: theme,
            themeMode: themeMode,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String userId,
            required String theme,
            required String themeMode,
            Value<int> rowid = const Value.absent(),
          }) =>
              SettingsCompanion.insert(
            userId: userId,
            theme: theme,
            themeMode: themeMode,
            rowid: rowid,
          ),
        ));
}

class $$SettingsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer(super.$state);
  ColumnFilters<String> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get theme => $state.composableBuilder(
      column: $state.table.theme,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get themeMode => $state.composableBuilder(
      column: $state.table.themeMode,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$SettingsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get theme => $state.composableBuilder(
      column: $state.table.theme,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get themeMode => $state.composableBuilder(
      column: $state.table.themeMode,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
}
