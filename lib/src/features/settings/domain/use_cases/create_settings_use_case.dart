import 'package:either_dart/either.dart';
import 'package:zaracast/src/core/errors/failure.dart';
import 'package:zaracast/src/core/utils/use_case_types.dart';
import 'package:zaracast/src/features/settings/data/params/create_settings_params.dart';
import 'package:zaracast/src/features/settings/domain/repositories/settings_repository.dart';

class CreateSettingsUseCase extends AsyncUseCase<void, CreateSettingsParams> {
  CreateSettingsUseCase(this.settingsRepository);

  final SettingsRepository settingsRepository;

  @override
  Future<Either<Failure, void>> call(CreateSettingsParams params) async {
    final result = await settingsRepository.createSettings(params);

    return result.fold(Left.new, Right.new);
  }
}
