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
        final index = entry.key;
        final item = entry.value;
        return ListTile(
          leading: item.icon != null ? Icon(item.icon) : null,
          title: Text(item.name),
          selected: item.selected,
          shape: index == 0
              // For the first item in the list, round the top corners to half
              // of the M3 top corner radius spec for a nice look.
              //
              // https://m3.material.io/components/bottom-sheets/overview#2cce5bae-eb83-40b0-8e52-5d0cfaa9b795
              ? const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                )
              : null,
          onTap: () => Navigator.of(context).pop(item.value),
        );
      }).toList();

      return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [...children],
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
