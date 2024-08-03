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

class StatefulShellScaffoldChild extends StatefulWidget {
  const StatefulShellScaffoldChild(this.child, {super.key});

  final StatefulNavigationShell child;

  @override
  State<StatefulShellScaffoldChild> createState() =>
      _StatefulShellScaffoldChildState();
}

class _StatefulShellScaffoldChildState
    extends State<StatefulShellScaffoldChild> {
  late bool _showBottomSheet;

  @override
  void initState() {
    super.initState();
    _showBottomSheet = false;
  }

  void _onTap(int index) => widget.child
      .goBranch(index, initialLocation: index == widget.child.currentIndex);

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
        child: widget.child,
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        InkWell(
          onTap: () => setState(() => _showBottomSheet = !_showBottomSheet),
          child: const AudioPlayer(),
        ),
      ],
      /*
      bottomSheet: Visibility(
        visible: _showBottomSheet,
        replacement: GestureDetector(
          onVerticalDragStart: (d) =>
              setState(() => _showBottomSheet = !_showBottomSheet),
          child: const ListTile(
            minTileHeight: 20,
            contentPadding: EdgeInsets.zero,
            minVerticalPadding: 0,
            subtitle: Icon(Icons.horizontal_rule_rounded, size: 48),
            titleAlignment: ListTileTitleAlignment.center,
          ),
        ),
        child: BottomSheet(
          showDragHandle: true,
          onClosing: () {},
          builder: (context) {
            return const ListTile(
              title: Text('Manage the queue'),
            );
          },
        ),
      ),
*/
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.child.currentIndex,
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

class AudioPlayer extends StatelessWidget {
  const AudioPlayer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
