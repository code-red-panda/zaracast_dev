import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zaracast/src/core/constants/constants.dart';
import 'package:zaracast/src/core/dependency_injection/singletons.dart';
import 'package:zaracast/src/shared/presentation/widgets/sliver_app_bar_builder.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverAppBarBuilder(title: 'Admin Panel'),
        SliverList.list(
          children: [
            ListTile(
              title: const Text('SELECT * FROM userSettings;'),
              onTap: () async {
                final result = await appDatabase.managers.userSettings
                    .filter((f) => f.userId(placeHolderUserId))
                    .getSingle();

                if (kDebugMode) debugPrint('$result');
              },
            ),
          ],
        ),
      ],
    );
  }
}
