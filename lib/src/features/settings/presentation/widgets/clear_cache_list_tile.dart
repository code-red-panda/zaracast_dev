import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zaracast/src/shared/presentation/blocs/snack_bar/snack_bar_bloc.dart';
import 'package:zaracast/src/shared/presentation/utils/dialogs.dart';

class ClearCacheListTile extends StatelessWidget {
  const ClearCacheListTile({required this.prefs, super.key});

  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.delete),
      title: const Text('Clear Cache'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () async {
        final result = await zShowDialog<bool>(
          context,
          const DialogItem(
            title: 'Clear cache?',
            description:
                'Clearing cache removes all temporary files and images from '
                'your device. They will be downloaded again as needed.',
          ),
        );

        if (result ?? false) {
          // In memory cache?
          PaintingBinding.instance.imageCache.clear();
          PaintingBinding.instance.imageCache.clearLiveImages();

          // Shared preferences
          await prefs.clear();

          // Temporary directory
          final tempDir = await getTemporaryDirectory();

          if (tempDir.existsSync()) {
            final dir = Directory(tempDir.path);

            dir.listSync().forEach((file) {
              if (file is File) {
                file.deleteSync();
              } else if (file is Directory) {
                file.deleteSync(recursive: true);
              }
            });

            if (!context.mounted) return;
            context
                .read<SnackBarBloc>()
                .add(const ShowSnackBarEvent('Cache cleared'));
          }
        }
      },
    );
  }
}
