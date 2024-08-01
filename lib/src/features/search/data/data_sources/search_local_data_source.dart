import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:zaracast/src/core/utils/drift/app_database.dart';
import 'package:zaracast/src/features/podcast/data/models/podcast_model.dart';
import 'package:zaracast/src/features/search/data/params/create_podcast_search_params.dart';
import 'package:zaracast/src/shared/data/params/no_params.dart';

abstract class SearchLocalDataSource {
  Future<void> createPodcastSearch(CreatePodcastSearchParams params);
  Future<void> deletePodcastSearch(NoParams params);
  Stream<List<PodcastModel>> streamPodcastSearch(NoParams params);
}

// This is where all errors should be caught and converted to LocalExceptions.
// Do not print errors here.
class SearchLocalDataSourceImpl implements SearchLocalDataSource {
  SearchLocalDataSourceImpl(
    this.appDatabase,
  );

  final AppDatabase appDatabase;

  /// Create a podcast search history entry in the database.
  ///
  /// If the podcast already exists, continue.
  ///
  /// If the search history already exists, update it.
  @override
  Future<void> createPodcastSearch(CreatePodcastSearchParams params) async {
    final json = PodcastModel.fromEntity(params.podcastEntity).toJson();

    // TODO(red): Can this be assigned to operation and pass to the execute method to handle errors?
    await appDatabase.transaction(() async {
      await appDatabase.managers.podcasts.create(
        // TODO(red): The table name is Podcasts. I don't understand where it's getting the singular "Podcast" from.
        (companion) => Podcast.fromJson(json),
        mode: InsertMode.insertOrIgnore,
      );

      await appDatabase.managers.podcastSearchHistory.create(
        (companion) => companion(
          id: Value(params.podcastEntity.id),
          searchedAt: DateTime.now(),
        ),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  @override
  Future<void> deletePodcastSearch(NoParams params) async {
    final operation = appDatabase.managers.podcastSearchHistory.delete();

    await appDatabase.execute<void>(() async => operation);
  }

  @override
  Stream<List<PodcastModel>> streamPodcastSearch(NoParams params) {
    final query = appDatabase.select(appDatabase.podcastSearchHistory).join([
      innerJoin(
        appDatabase.podcasts,
        appDatabase.podcasts.id.equalsExp(appDatabase.podcastSearchHistory.id),
      ),
    ])
      ..orderBy([
        OrderingTerm(
          expression: appDatabase.podcastSearchHistory.searchedAt,
          mode: OrderingMode.desc,
        ),
      ]);

    return query.watch().map((rows) {
      return rows.map((row) {
        final json = row.readTable(appDatabase.podcasts).toJson();
        return PodcastModel.fromJson(json);
      }).toList();
    }).handleError((Object error) {
      if (kDebugMode) {
        debugPrint('streamPodcastSearch() unhandled error: $error');
      }
    });
  }
}
