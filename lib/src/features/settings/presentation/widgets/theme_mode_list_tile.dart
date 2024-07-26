import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaracast/src/features/settings/data/params/update_theme_mode_params.dart';
import 'package:zaracast/src/features/settings/presentation/blocs/settings_bloc.dart';
import 'package:zaracast/src/shared/presentation/utils/bottom_sheets.dart';

class ThemeModeListTile extends StatelessWidget {
  const ThemeModeListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SettingsBloc, SettingsState, ThemeMode>(
      selector: (state) =>
          state is SettingsLoaded ? state.themeMode : ThemeMode.system,
      builder: (context, state) {
        var themeName = 'System';

        if (state == ThemeMode.light) {
          themeName = 'Light';
        } else if (state == ThemeMode.dark) {
          themeName = 'Dark';
        }

        return SizedBox(
          child: ListTile(
            leading: const Icon(Icons.brightness_4),
            title: const Text('Theme Mode'),
            trailing: SizedBox(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(themeName),
                  const Icon(Icons.chevron_right),
                ],
              ),
            ),
            onTap: () async {
              final themeMode = await zShowModalBottomSheet<ThemeMode>(
                context,
                'Theme Mode',
                [
                  BottomSheetListItem(
                    icon: Icons.light_mode_outlined,
                    name: 'Light',
                    value: ThemeMode.light,
                    selected: state == ThemeMode.light,
                  ),
                  BottomSheetListItem(
                    icon: Icons.dark_mode,
                    name: 'Dark',
                    value: ThemeMode.dark,
                    selected: state == ThemeMode.dark,
                  ),
                  BottomSheetListItem(
                    icon: Icons.auto_awesome_outlined,
                    name: 'System',
                    value: ThemeMode.system,
                    selected: state == ThemeMode.system,
                  ),
                ],
              );
              if (themeMode != null) {
                final params = UpdateThemeModeParams(themeMode: themeMode);

                if (!context.mounted) return;
                context.read<SettingsBloc>().add(UpdateThemeModeEvent(params));
              }
            },
          ),
        );
      },
    );
  }
}
