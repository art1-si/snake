import 'package:flutter/material.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/view/pixel_tile.dart';

class CanvasGrid extends StatelessWidget {
  const CanvasGrid({
    super.key,
    required this.pixelSize,
    required this.gridSize,
  });

  final double pixelSize;
  final int gridSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          gridSize,
          (yOffset) => Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              gridSize,
              (xOffset) {
                return PixelTile(
                  size: pixelSize,
                );
              },
            ),
          ),
        ),
      );
    });
  }
}
