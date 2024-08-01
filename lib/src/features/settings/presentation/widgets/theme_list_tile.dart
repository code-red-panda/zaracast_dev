import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaracast/src/core/themes/material_theme.dart';
import 'package:zaracast/src/features/settings/data/params/update_theme_params.dart';
import 'package:zaracast/src/features/settings/presentation/blocs/settings_bloc.dart';
import 'package:zaracast/src/shared/presentation/utils/bottom_sheets.dart';

class ThemeListTile extends StatelessWidget {
  const ThemeListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SettingsBloc, SettingsState, MaterialTheme>(
      selector: (state) => state is SettingsLoaded
          ? state.settings.theme
          : MaterialTheme.ghostSpider,
      builder: (context, state) {
        var themeName = 'Ghost Spider';

        if (state == MaterialTheme.ghostSpider) {
          themeName = 'Ghost Spider';
        } else if (state == MaterialTheme.ironMan) {
          themeName = 'Iron Man';
        } else if (state == MaterialTheme.hulk) {
          themeName = 'Hulk';
        }

        return SizedBox(
          child: ListTile(
            leading: const Icon(Icons.palette),
            title: const Text('Theme'),
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
              final theme = await zShowModalBottomSheet<MaterialTheme>(
                context,
                'Theme',
                [
                  BottomSheetListItem(
                    icon: Icons.bug_report,
                    name: 'Ghost Spider',
                    value: MaterialTheme.ghostSpider,
                    selected: state == MaterialTheme.ghostSpider,
                  ),
                  BottomSheetListItem(
                    icon: Icons.iron,
                    name: 'Iron Man',
                    value: MaterialTheme.ironMan,
                    selected: state == MaterialTheme.ironMan,
                  ),
                  BottomSheetListItem(
                    icon: Icons.front_hand,
                    name: 'Hulk',
                    value: MaterialTheme.hulk,
                    selected: state == MaterialTheme.hulk,
                  ),
                ],
              );

              if (theme != null) {
                final params = UpdateThemeParams(theme);

                if (!context.mounted) return;
                context.read<SettingsBloc>().add(UpdateThemeEvent(params));
              }
            },
          ),
        );
      },
    );
  }
}
