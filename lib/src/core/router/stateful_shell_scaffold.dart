import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zaracast/src/shared/presentation/blocs/snack_bar/snack_bar_bloc.dart';

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
      resizeToAvoidBottomInset: false,
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
