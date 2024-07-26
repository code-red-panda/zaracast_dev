import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:zaracast/src/core/errors/exceptions.dart';
import 'package:zaracast/src/core/errors/failure.dart';
import 'package:zaracast/src/core/network/network_info.dart';
import 'package:zaracast/src/features/podcast/domain/entities/podcast_entity.dart';
import 'package:zaracast/src/features/search/data/data_sources/search_local_data_source.dart';
import 'package:zaracast/src/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:zaracast/src/features/search/data/params/search_podcasts_params.dart';
import 'package:zaracast/src/features/search/domain/repositories/search_repository.dart';

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
}
