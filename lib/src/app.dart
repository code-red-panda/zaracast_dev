import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:zaracast/src/core/router/go_router.dart';
import 'package:zaracast/src/core/themes/material_theme_builder.dart';
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
    final textTheme =
        buildTextTheme(context, bodyFontString, displayFontString);
    final themes = buildThemes(textTheme);

    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous != current && current is SettingsLoaded,
      builder: (context, state) {
        // Default theme mode and theme
        var themeMode = ThemeMode.system;
        var theme = themes.values.first;

        if (state is SettingsLoaded) {
          themeMode = state.settings.themeMode;
          theme = themes[state.settings.theme] ?? theme;
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
