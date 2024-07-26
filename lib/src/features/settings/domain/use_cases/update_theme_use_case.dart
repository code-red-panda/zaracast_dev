import 'package:either_dart/either.dart';
import 'package:zaracast/src/core/errors/failure.dart';
import 'package:zaracast/src/core/utils/use_case_types.dart';
import 'package:zaracast/src/features/settings/data/params/update_theme_params.dart';
import 'package:zaracast/src/features/settings/domain/repositories/settings_repository.dart';

class UpdateThemeUseCase extends AsyncUseCase<void, UpdateThemeParams> {
  UpdateThemeUseCase(this.settingsRepository);

  final SettingsRepository settingsRepository;

  @override
  Future<Either<Failure, void>> call(UpdateThemeParams params) async {
    final result = await settingsRepository.updateTheme(params);

    return result.fold(Left.new, Right.new);
  }
}
