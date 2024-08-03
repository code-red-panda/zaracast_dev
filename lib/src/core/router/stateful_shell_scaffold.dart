import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zaracast/src/core/dependency_injection/singletons.dart';
import 'package:zaracast/src/shared/presentation/blocs/snack_bar/snack_bar_bloc.dart';
import 'package:zaracast/src/shared/presentation/utils/bottom_sheets.dart';
import 'package:zaracast/src/shared/presentation/widgets/cached_network_image_builder.dart';

class StatefulShellScaffold extends StatelessWidget {
  const StatefulShellScaffold(this.child, {super.key});

  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SnackBarBloc>(
          create: (_) => SnackBarBloc(),
        ),
      ],
      child: StatefulShellScaffoldChild(child),
    );
  }
}

class StatefulShellScaffoldChild extends StatelessWidget {
  const StatefulShellScaffoldChild(this.child, {super.key});

  final StatefulNavigationShell child;

  void _onTap(int index) =>
      child.goBranch(index, initialLocation: index == child.currentIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Allows scrolling to the end of lists when the keyboard (or other
      // floating widgets) may otherwise cover them.
      resizeToAvoidBottomInset: true,
      body: BlocListener<SnackBarBloc, SnackBarState>(
        listenWhen: (previous, current) => current is SnackBarLoaded,
        listener: (context, state) {
          if (state is SnackBarLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text(state.userMessage),
              ),
            );

            context.read<SnackBarBloc>().add(const ClearSnackBarEvent());
          }
        },
        child: child,
      ),
      bottomSheet: ListTile(
        leading: SizedBox(
          height: 64,
          width: 64,
          child: CachedNetworkImageBuilder(
            imageUrl:
                'https://i.pinimg.com/originals/59/de/4f/59de4fb27cd342f038e2d90ea75bcea0.jpg',
            prefs: prefs,
          ),
        ),
        title: const Text('This Is The Episode Tile'),
        subtitle: const LinearProgressIndicator(value: .3, minHeight: 1),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.fast_rewind),
              iconSize: 16,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.play_arrow),
              iconSize: 16,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.fast_forward),
              iconSize: 16,
              onPressed: () {},
            ),
          ],
        ),
        onTap: () async {
          final filter = await zShowModalBottomSheet<String>(
            context,
            ListTile(
              title: const Text('Manage play next from show or queue'),
            ),
            [
              const BottomSheetListItem(
                icon: Icons.play_arrow,
                name: 'Play next',
                value: 'Play next',
                selected: false,
              ),
              const BottomSheetListItem(
                icon: Icons.playlist_add,
                name: 'Add to queue',
                value: 'Add to queue',
                selected: false,
              ),
            ],
          );

          if (filter != null) {
            //  final params = UpdateThemeParams(
            //    userId: placeHolderUserId,
            //    theme: theme,
            //  );

            if (!context.mounted) return;
            //   context
            //       .read<SettingsBloc>()
            //       .add(UpdateThemeEvent(params));
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: child.currentIndex,
        items: bottomNavItems
            .map(
              (item) => BottomNavigationBarItem(
                icon: item.icon,
                label: item.label,
              ),
            )
            .toList(),
        onTap: _onTap,
      ),
    );
  }
}

const bottomNavItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.search),
    label: 'Discover',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.settings),
    label: 'Settings',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.admin_panel_settings),
    label: 'Admin',
  ),
];
