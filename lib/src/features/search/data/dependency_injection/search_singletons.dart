import 'dart:async';

import 'package:zaracast/src/core/dependency_injection/singletons.dart';
import 'package:zaracast/src/features/search/data/data_sources/search_local_data_source.dart';
import 'package:zaracast/src/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:zaracast/src/features/search/data/repositories/search_repository_impl.dart';
import 'package:zaracast/src/features/search/domain/use_cases/create_podcast_search_use_case.dart';
import 'package:zaracast/src/features/search/domain/use_cases/delete_podcast_search_use_case.dart';
import 'package:zaracast/src/features/search/domain/use_cases/search_podcasts_use_case.dart';
import 'package:zaracast/src/features/search/domain/use_cases/stream_podcast_search_use_case.dart';
import 'package:zaracast/src/features/search/presentation/blocs/podcast_search_history/podcast_search_history_bloc.dart';
import 'package:zaracast/src/features/search/presentation/blocs/search/search_bloc.dart';

Future<void> registerSearchSingletons() async {
  getIt
    // Repository
    ..registerLazySingleton(
      () => SearchRepositoryImpl(
        localDataSource: SearchLocalDataSourceImpl(appDatabase),
        remoteDataSource: SearchRemoteDataSourceImpl(
          dio: dio,
          podcastIndex: podcastIndex,
        ),
        networkInfo: networkInfo,
      ),
    )

    // Blocs
    ..registerLazySingleton(
      () => SearchBloc(SearchPodcastsUseCase(searchRepository)),
    )
    ..registerLazySingleton(
      () => PodcastSearchHistoryBloc(
        CreatePodcastSearchUseCase(searchRepository),
        DeletePodcastSearchUseCase(searchRepository),
        StreamPodcastSearchUseCase(searchRepository),
      ),
    );
}

// Getters
SearchBloc get searchBloc => getIt.get<SearchBloc>();
PodcastSearchHistoryBloc get podcastSearchHistoryBloc =>
    getIt.get<PodcastSearchHistoryBloc>();
SearchRepositoryImpl get searchRepository => getIt.get<SearchRepositoryImpl>();
