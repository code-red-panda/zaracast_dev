import 'package:zaracast/src/core/themes/material_theme.dart';

class UpdateThemeParams {
  const UpdateThemeParams({required this.userId, required this.theme});

  final String userId;
  final MaterialTheme theme;
}
