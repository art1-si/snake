import 'package:flutter/material.dart';
import 'package:snake/presentation/shared/select_button_row/model/selectable_item.dart';
import 'package:snake/presentation/theme/app_colors.dart';

/// A row of buttons that can be used to select an item from a list of items.
class SelectButtonRow<ItemT> extends StatefulWidget {
  const SelectButtonRow({super.key, required this.value, required this.items, required this.onChanged});

  final ItemT value;

  final List<SelectableItem<ItemT>> items;
  final void Function(ItemT) onChanged;

  @override
  State<SelectButtonRow> createState() => _SelectButtonRowState<ItemT>();
}

class _SelectButtonRowState<ItemT> extends State<SelectButtonRow<ItemT>> {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: widget.items
            .map(
              (selectableItem) => ElevatedButton(
                onPressed: () {
                  widget.onChanged(selectableItem.item);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) {
                      if (selectableItem.item == widget.value) {
                        return AppColors.primary;
                      } else {
                        return AppColors.canvasBackground;
                      }
                    },
                  ),
                ),
                child: selectableItem.child,
              ),
            )
            .toList());
  }
}
