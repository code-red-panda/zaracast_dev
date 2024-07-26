import 'package:either_dart/either.dart';
import 'package:zaracast/src/core/errors/failure.dart';
import 'package:zaracast/src/core/utils/use_case_types.dart';
import 'package:zaracast/src/features/settings/data/params/update_theme_mode_params.dart';
import 'package:zaracast/src/features/settings/domain/repositories/settings_repository.dart';

class UpdateThemeModeUseCase extends AsyncUseCase<void, UpdateThemeModeParams> {
  UpdateThemeModeUseCase(this.settingsRepository);

  final SettingsRepository settingsRepository;

  @override
  Future<Either<Failure, void>> call(UpdateThemeModeParams params) async {
    final result = await settingsRepository.updateThemeMode(params);

    return result.fold(Left.new, Right.new);
  }
}
