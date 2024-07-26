import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaracast/src/features/settings/presentation/blocs/settings_bloc.dart';
import 'package:zaracast/src/features/settings/presentation/widgets/clear_cache_list_tile.dart';
import 'package:zaracast/src/features/settings/presentation/widgets/theme_list_tile.dart';
import 'package:zaracast/src/features/settings/presentation/widgets/theme_mode_list_tile.dart';
import 'package:zaracast/src/shared/presentation/widgets/sliver_app_bar_builder.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsBloc, SettingsState>(
      listenWhen: (previous, current) => current is SettingsError,
      listener: (context, state) {
        if (state is SettingsError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.userMessage),
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      child: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBarBuilder.largeTitle(
            title: 'Settings',
            scrollController: _scrollController,
          ),
          SliverList.list(
            children: const [
              Card(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      ThemeListTile(),
                      Divider(),
                      ThemeModeListTile(),
                      Divider(),
                      ClearCacheListTile(),
                    ],
                  ),
                ),
              ),
              AboutListTile(
                icon: Icon(Icons.info_outline),
                applicationName: 'Pokemon',
                applicationVersion: '1.0.0',
                applicationIcon: FlutterLogo(),
                applicationLegalese: '© 2021 Pokemon',
                child: Text('About Pokemon'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
