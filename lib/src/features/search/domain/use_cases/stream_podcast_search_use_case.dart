import 'package:either_dart/either.dart';
import 'package:zaracast/src/core/errors/failure.dart';
import 'package:zaracast/src/core/utils/use_case_types.dart';
import 'package:zaracast/src/features/podcast/domain/entities/podcast_entity.dart';
import 'package:zaracast/src/features/search/domain/repositories/search_repository.dart';
import 'package:zaracast/src/shared/data/params/no_params.dart';

class StreamPodcastSearchUseCase
    extends UseCase<Stream<List<PodcastEntity>>, NoParams> {
  StreamPodcastSearchUseCase(this.searchRepository);

  final SearchRepository searchRepository;

  @override
  Either<Failure, Stream<List<PodcastEntity>>> call(NoParams params) {
    final result = searchRepository.streamPodcastSearch(params);

    return result.fold(Left.new, Right.new);
  }
}
