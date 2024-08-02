import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zaracast/src/core/router/stateful_shell_scaffold.dart';
import 'package:zaracast/src/features/auth/presentation/pages/otp_page.dart';
import 'package:zaracast/src/features/auth/presentation/pages/sign_in_page.dart';
import 'package:zaracast/src/features/discover/presentation/pages/discover_page.dart';
import 'package:zaracast/src/features/podcast_detail/presentation/pages/podcast_detail_page.dart';
import 'package:zaracast/src/features/settings/presentation/pages/admin_page.dart';
import 'package:zaracast/src/features/settings/presentation/pages/settings_page.dart';

final discoverKey = GlobalKey<NavigatorState>();
final settingsKey = GlobalKey<NavigatorState>();

GoRouter buildGoRouter() {
  /// Parse an integer from a path parameter.
  ///
  /// Return the integer if parsed, otherwise return the default value.
  int getIntFromParam(String? key, {int defaultValue = 0}) {
    if (key == null) return defaultValue;

    return int.tryParse(key) ?? defaultValue;
  }

  String? getStringFromExtra(Object? extra, String key) {
    if (extra == null) return null;

    if (extra is Map<String, dynamic>) {
      return extra[key] as String?;
    } else {
      return null;
    }
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
            navigatorKey: discoverKey,
            routes: <RouteBase>[
              GoRoute(
                path: '/discover',
                builder: (context, state) => const DiscoverPage(),
                routes: <RouteBase>[
                  GoRoute(
                    path: ':id',
                    builder: (context, state) {
                      final id = getIntFromParam(state.pathParameters['id']);
                      final title = getStringFromExtra(state.extra, 'title');

                      return PodcastDetailPage(id: id, title: title);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: settingsKey,
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
