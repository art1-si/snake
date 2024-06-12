import 'package:flutter/material.dart';

class SelectableItem<ItemT> {
  const SelectableItem({
    required this.item,
    required this.child,
  });

  final ItemT item;

  final Widget child;
}
