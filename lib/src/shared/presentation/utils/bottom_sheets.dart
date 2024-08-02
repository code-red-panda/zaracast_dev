import 'package:flutter/material.dart';

Future<T?> zShowModalBottomSheet<T>(
  BuildContext context,
  String title,
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
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
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
