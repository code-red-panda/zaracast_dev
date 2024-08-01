import 'package:either_dart/either.dart';
import 'package:zaracast/src/core/errors/failure.dart';
import 'package:zaracast/src/core/utils/use_case_types.dart';
import 'package:zaracast/src/features/settings/data/params/stream_settings_params.dart';
import 'package:zaracast/src/features/settings/domain/entities/settings_entity.dart';
import 'package:zaracast/src/features/settings/domain/repositories/settings_repository.dart';

class StreamSettingsUseCase
    extends UseCase<Stream<SettingsEntity>, StreamSettingsParams> {
  StreamSettingsUseCase(this.settingsRepository);

  final SettingsRepository settingsRepository;

  @override
  Either<Failure, Stream<SettingsEntity>> call(
    StreamSettingsParams params,
  ) {
    final result = settingsRepository.streamSettings(params);

    return result.fold(Left.new, Right.new);
  }
}
