import 'package:either_dart/either.dart';
import 'package:zaracast/src/core/errors/failure.dart';
import 'package:zaracast/src/core/utils/use_case_types.dart';
import 'package:zaracast/src/features/podcast/domain/entities/podcast_entity.dart';
import 'package:zaracast/src/features/search/data/params/search_podcasts_params.dart';
import 'package:zaracast/src/features/search/domain/repositories/search_repository.dart';

class SearchPodcastsUseCase
    extends AsyncUseCase<List<PodcastEntity>, SearchPodcastsParams> {
  SearchPodcastsUseCase(this.searchRepository);

  final SearchRepository searchRepository;

  @override
  Future<Either<Failure, List<PodcastEntity>>> call(
    SearchPodcastsParams params,
  ) async {
    final result = await searchRepository.searchPodcasts(params);

    return result.fold(Left.new, Right.new);
  }
}
