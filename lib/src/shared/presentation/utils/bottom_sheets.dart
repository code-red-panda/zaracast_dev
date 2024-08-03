import 'package:flutter/material.dart';

/// TODO(red): Update this to accept a list tile so that we can use switches to be like a settings page
Future<T?> zShowModalBottomSheet<T>(
  BuildContext context,
  Widget header,
  List<BottomSheetListItem<T>> items,
) async {
  return showModalBottomSheet<T?>(
    context: context,
    enableDrag: false,
    builder: (BuildContext context) {
      final children = items.asMap().entries.map((entry) {
        final item = entry.value;
        return ListTile(
          leading: item.icon != null ? Icon(item.icon) : null,
          title: Text(item.name),
          selected: item.selected,
          onTap: () => Navigator.of(context).pop(item.value),
        );
      }).toList();

      return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: header,
            ),
            const Divider(indent: 16, endIndent: 16),
            ...children
          ],
        ),
      );
    },
  );
}

class BottomSheetListItem<T> {
  const BottomSheetListItem({
    required this.name,
    required this.value,
    this.selected = false,
    this.icon,
  });

  final IconData? icon;
  final String name;
  final T value;
  final bool selected;
}
