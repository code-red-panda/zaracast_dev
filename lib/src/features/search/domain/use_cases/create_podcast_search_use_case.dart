import 'package:either_dart/either.dart';
import 'package:zaracast/src/core/errors/failure.dart';
import 'package:zaracast/src/core/utils/use_case_types.dart';
import 'package:zaracast/src/features/search/data/params/create_podcast_search_params.dart';
import 'package:zaracast/src/features/search/domain/repositories/search_repository.dart';

class CreatePodcastSearchUseCase
    extends AsyncUseCase<void, CreatePodcastSearchParams> {
  CreatePodcastSearchUseCase(this.searchRepository);

  final SearchRepository searchRepository;

  @override
  Future<Either<Failure, void>> call(
    CreatePodcastSearchParams params,
  ) async {
    final result = await searchRepository.createPodcastSearch(params);

    return result.fold(Left.new, Right.new);
  }
}
