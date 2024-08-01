import 'package:either_dart/either.dart';
import 'package:zaracast/src/core/errors/failure.dart';
import 'package:zaracast/src/core/utils/use_case_types.dart';
import 'package:zaracast/src/features/search/domain/repositories/search_repository.dart';
import 'package:zaracast/src/shared/data/params/no_params.dart';

class DeletePodcastSearchUseCase extends AsyncUseCase<void, NoParams> {
  DeletePodcastSearchUseCase(this.searchRepository);

  final SearchRepository searchRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    final result = await searchRepository.deletePodcastSearch(params);

    return result.fold(Left.new, Right.new);
  }
}
