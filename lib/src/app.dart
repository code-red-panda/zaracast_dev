import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:zaracast/src/core/router/go_router.dart';
import 'package:zaracast/src/core/themes/ghost_spider_material_theme.dart';
import 'package:zaracast/src/core/themes/hulk_material_theme.dart';
import 'package:zaracast/src/core/themes/iron_man_material_theme.dart';
import 'package:zaracast/src/core/themes/material_theme.dart';
import 'package:zaracast/src/features/settings/data/dependency_injection/settings_singletons.dart';
import 'package:zaracast/src/features/settings/presentation/blocs/settings_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: settingsBloc,
      child: const MyAppChild(),
    );
  }
}

class MyAppChild extends StatelessWidget {
  const MyAppChild({super.key});

  @override
  Widget build(BuildContext context) {
    final router = buildGoRouter();
    final textTheme = createTextTheme(
      context,
      'Red Hat Text',
      'Red Hat Display',
    );

    final ghostSpiderTheme = GhostSpiderMaterialTheme(textTheme);
    final ironManTheme = IronManMaterialTheme(textTheme);
    final hulkTheme = HulkMaterialTheme(textTheme);

    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous != current && current is SettingsLoaded,
      builder: (context, state) {
        var themeMode = ThemeMode.system;
        BaseMaterialTheme theme = ghostSpiderTheme;

        if (state is SettingsLoaded) {
          themeMode = state.themeMode;
          switch (state.theme) {
            case MaterialTheme.ghostSpider:
              theme = ghostSpiderTheme;
            case MaterialTheme.ironMan:
              theme = ironManTheme;
            case MaterialTheme.hulk:
              theme = hulkTheme;
          }
        }
        return MaterialApp.router(
          title: 'ZaraCast',
          routerConfig: router,
          restorationScopeId: 'app',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
          ],
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          theme: theme.light(),
          darkTheme: theme.dark(),
          themeMode: themeMode,
        );
      },
    );
  }
}
