import 'package:either_dart/either.dart';
import 'package:zaracast/src/core/errors/failure.dart';
import 'package:zaracast/src/features/podcast/domain/entities/podcast_entity.dart';
import 'package:zaracast/src/features/search/data/params/create_podcast_search_params.dart';
import 'package:zaracast/src/features/search/data/params/search_podcasts_params.dart';
import 'package:zaracast/src/shared/data/params/no_params.dart';

// ignore: one_member_abstracts
abstract class SearchRepository {
  Future<Either<Failure, void>> createPodcastSearch(
    CreatePodcastSearchParams params,
  );
  Future<Either<Failure, void>> deletePodcastSearch(NoParams params);
  Future<Either<Failure, List<PodcastEntity>>> searchPodcasts(
    SearchPodcastsParams params,
  );
  Either<Failure, Stream<List<PodcastEntity>>> streamPodcastSearch(
    NoParams params,
  );
}
