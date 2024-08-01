import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:zaracast/src/core/errors/exceptions.dart';
import 'package:zaracast/src/core/errors/failure.dart';
import 'package:zaracast/src/core/network/network_info.dart';
import 'package:zaracast/src/features/podcast/data/models/podcast_model.dart';
import 'package:zaracast/src/features/podcast/domain/entities/podcast_entity.dart';
import 'package:zaracast/src/features/search/data/data_sources/search_local_data_source.dart';
import 'package:zaracast/src/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:zaracast/src/features/search/data/params/create_podcast_search_params.dart';
import 'package:zaracast/src/features/search/data/params/search_podcasts_params.dart';
import 'package:zaracast/src/features/search/domain/repositories/search_repository.dart';
import 'package:zaracast/src/shared/data/params/no_params.dart';

// This is where the local/remote orchestration logic happens.
// This is where exceptions should be printed for debugging.
// This is where exceptions should be converted to failures with user friendly
// messaging.
class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  final SearchLocalDataSource localDataSource;
  final SearchRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, void>> createPodcastSearch(
    CreatePodcastSearchParams params,
  ) async {
    try {
      final result = await localDataSource.createPodcastSearch(params);

      return Right(result);
    } on LocalException catch (e) {
      return Left(LocalFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deletePodcastSearch(
    NoParams params,
  ) async {
    try {
      final result = await localDataSource.deletePodcastSearch(params);

      return Right(result);
    } on LocalException catch (e) {
      return Left(LocalFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<PodcastEntity>>> searchPodcasts(
    SearchPodcastsParams params,
  ) async {
    try {
      if (!await networkInfo.hasInternet) {
        throw ServerException.noInternetConnection(
          arguments: {
            'searchTerm': params.searchTerm,
            'maxResults': params.maxResults,
          },
        );
      }

      final result = await remoteDataSource.searchPodcasts(params);

      return Right(result);
    } on ServerException catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }

      if (e.statusCode == 1) {
        return Left(ServerFailure('No internet connection'));
      }

      return Left(ServerFailure('Error searching podcasts'));
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint('Generic Exception: $e');
      }

      return Left(ServerFailure('Error searching podcasts'));
    }
  }

  @override
  Either<Failure, Stream<List<PodcastModel>>> streamPodcastSearch(
    NoParams params,
  ) {
    try {
      final result = localDataSource.streamPodcastSearch(params);

      return Right(result);
    } on LocalException catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }

      return Left(LocalFailure('Error getting search history'));
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint('Generic Exception: $e');
      }

      return Left(LocalFailure('Error getting search history'));
    }
  }
}
