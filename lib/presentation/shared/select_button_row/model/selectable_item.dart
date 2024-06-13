import 'package:flutter/material.dart';

/// A selectable item that can be used in a `SelectButtonRow`.
class SelectableItem<ItemT> {
  const SelectableItem({
    required this.item,
    required this.child,
  });

  final ItemT item;

  final Widget child;
}
