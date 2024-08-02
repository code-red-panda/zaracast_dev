import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zaracast/src/core/router/stateful_shell_scaffold.dart';
import 'package:zaracast/src/features/auth/presentation/pages/otp_page.dart';
import 'package:zaracast/src/features/auth/presentation/pages/sign_in_page.dart';
import 'package:zaracast/src/features/discover/presentation/pages/discover_page.dart';
import 'package:zaracast/src/features/podcast_detail/presentation/pages/podcast_detail_page.dart';
import 'package:zaracast/src/features/settings/presentation/pages/admin_page.dart';
import 'package:zaracast/src/features/settings/presentation/pages/settings_page.dart';

GoRouter buildGoRouter() {
  /// Parse an integer from a path parameter.
  ///
  /// Return the integer if parsed, otherwise return the default value.
  int getIntParam(String? key, {int defaultValue = 0}) {
    if (key == null) return defaultValue;

    return int.tryParse(key) ?? defaultValue;
  }

  return GoRouter(
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: const Scaffold(body: Center(child: Text('404'))),
    ),
    initialLocation: '/discover',
    //refreshListenable: bloc,
    //redirect: redirect,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, child) => StatefulShellScaffold(child),
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/discover',
                builder: (context, state) => const DiscoverPage(),
                routes: <RouteBase>[
                  GoRoute(
                    path: ':id',
                    builder: (context, state) {
                      final id = getIntParam(state.pathParameters['id']);
                      final title = state.pathParameters['title'];

                      return PodcastDetailPage(id: id, title: title);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/settings',
                builder: (context, state) => const SettingsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/admin',
                builder: (context, state) => const AdminPage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        builder: (context, state) => const SignInPage(),
        path: '/sign-in',
        routes: <RouteBase>[
          GoRoute(
            builder: (context, state) => const OtpPage(),
            path: 'otp',
          ),
        ],
      ),
    ],
  );
}
