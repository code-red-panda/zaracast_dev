import 'package:flutter/material.dart';

Future<bool?> zShowDialog<bool>(
  BuildContext context,
  DialogItem item,
) async {
  return showDialog<bool?>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(item.title),
        content: Text(item.description),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

Future<void> zAboutShowDialog(BuildContext context) async {
  return showAboutDialog(
    context: context,
    applicationName: 'Pokemon',
    applicationVersion: '1.0.0',
    applicationIcon: const FlutterLogo(),
    applicationLegalese: '© 2021 Pokemon',
  );
}

class DialogItem {
  const DialogItem({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;
}
